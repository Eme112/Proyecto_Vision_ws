#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <ros/ros.h>
#include <sensor_msgs/image_encodings.h>
#include <tf2_ros/buffer.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <sensor_msgs/PointCloud2.h>


class Camera {
 public:
  Camera(ros::NodeHandle& n) : it_(n) {
    camera_sub_ = it_.subscribe("/camera/color/image_raw", 1, 
      &Camera::camera_callback, this);
    image_pub_ = it_.advertise("/object_detector/output_video", 1);
    // Subscribe to the /camera PointCloud2 topic. CAMBIO
    point_cloud_sub_ = it.subscribe("/camera/depth/points", 1,
      &Camera::point_cloud_cb, this);
    ROS_INFO("Subscriber initialized!");
    // Creation of tf_buffer object and listener
    tf2_ros::Buffer tf_buffer;
    tf2_ros::TransformListener listener(tf_buffer);
  }
 private:

  void showImage(cv::Mat& image) {
    cv::imshow("image", image);
    cv::waitKey(0);
    cv::destroyWindow("image");
  }

  cv::Point2f search_centroid_in_area(std::vector<cv::Point2f> centroid_vector, cv::Rect area) {
    float sum_x = 0.0;
    float sum_y = 0.0;
    int number_of_centroids_in_area = 0;
  
    for( int i = 0; i<centroid_vector.size(); i++) {
      if(centroid_vector[i].inside(area)) {
        sum_x += centroid_vector[i].x;
        sum_y += centroid_vector[i].y;
        number_of_centroids_in_area++;
      }
    }
    cv::Point2f extracted_point(sum_x/number_of_centroids_in_area, sum_y/number_of_centroids_in_area);
    return extracted_point;
  }

  void point_cloud_cb(const sensor_msgs::PointCloud2& pCloud) {
 
    geometry_msgs::Point box_position_camera_frame;
    pixel_to_3d_point(pCloud, box_centroid.x, box_centroid.y, box_position_camera_frame);
 
    geometry_msgs::Point target_position_camera_frame;
    pixel_to_3d_point(pCloud, target_centroid.x, target_centroid.y, target_position_camera_frame);

    box_position_base_frame = transform_between_frames(box_position_camera_frame, from_frame, to_frame);
    target_position_base_frame = transform_between_frames(target_position_camera_frame, from_frame, to_frame);
 
    ROS_INFO_STREAM("3d box position base frame: x " << box_position_base_frame.x << " y " << box_position_base_frame.y << " z " << box_position_base_frame.z);
    ROS_INFO_STREAM("3d target position base frame: x " << target_position_base_frame.x << " y " << target_position_base_frame.y << " z " << target_position_base_frame.z);
  }

  void pixel_to_3d_point(const sensor_msgs::PointCloud2 pCloud, const int u, const int v, geometry_msgs::Point &p) {
    // get width and height of 2D point cloud data
    int width = pCloud.width;
    int height = pCloud.height;
    
    // Convert from u (column / width), v (row/height) to position in array
    // where X,Y,Z data starts
    int arrayPosition = v*pCloud.row_step + u*pCloud.point_step;
    
    // compute position in array where x,y,z data start
    int arrayPosX = arrayPosition + pCloud.fields[0].offset; // X has an offset of 0
    int arrayPosY = arrayPosition + pCloud.fields[1].offset; // Y has an offset of 4
    int arrayPosZ = arrayPosition + pCloud.fields[2].offset; // Z has an offset of 8
    
    float X = 0.0;
    float Y = 0.0;
    float Z = 0.0;
    
    memcpy(&X, &pCloud.data[arrayPosX], sizeof(float));
    memcpy(&Y, &pCloud.data[arrayPosY], sizeof(float));
    memcpy(&Z, &pCloud.data[arrayPosZ], sizeof(float));
    
    p.x = X;
    p.y = Y;
    p.z = Z;
  }

  geometry_msgs::Point transform_between_frames(geometry_msgs::Point p, const std::string from_frame, const std::string to_frame) {
    geometry_msgs::PoseStamped input_pose_stamped;
    input_pose_stamped.pose.position = p;
    input_pose_stamped.header.frame_id = from_frame;
    input_pose_stamped.header.stamp = ros::Time::now();
 
    geometry_msgs::PoseStamped output_pose_stamped = tf_buffer.transform(input_pose_stamped, to_frame, ros::Duration(1));
    return output_pose_stamped.pose.position;
  }

  void camera_callback(const sensor_msgs::ImageConstPtr& img) {
    cv_bridge::CvImagePtr cv_ptr;
    // cv_bridge::CvImagePtr cv_ptr_filtered;
    try {
      cv_ptr = cv_bridge::toCvCopy(img, sensor_msgs::image_encodings::BGR8);
    } catch (cv_bridge::Exception& e) {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }

    float image_size_y = cv_ptr->image.rows;
    float image_size_x = cv_ptr->image.cols;

    cv::Mat frame_Gray, canny_output;
    // Pass image to gray
    cv::cvtColor(cv_ptr->image, frame_Gray, cv::COLOR_BGR2GRAY);
    // Apply canny filter
    cv::Canny(frame_Gray, canny_output,10,350);

    // Detect the contours on the binary image using cv2.CHAIN_APPROX_NONE
    std::vector<std::vector<cv::Point>> contours;
    std::vector<cv::Vec4i> hierarchy;
    cv::findContours(canny_output, contours, hierarchy, cv::RETR_TREE, cv::CHAIN_APPROX_NONE);

    // get the moments
    std::vector<cv::Moments> mu(contours.size());
    for( int i = 0; i < contours.size(); i++ )
    { mu[i] = cv::moments( contours[i], false ); }
    
    // get the centroid of contours.
    std::vector<cv::Point2f> mc(contours.size());
    for( int i = 0; i < contours.size(); i++) {
      float mc_x = mu[i].m10/mu[i].m00;
      float mc_y = mu[i].m01/mu[i].m00;
      mc[i] = cv::Point2f(mc_x, mc_y);
    }

     // get the centroid of figures.
    std::vector<cv::Point2f> centroids(contours.size());
    for( int i = 0; i<contours.size(); i++) {
      float centroid_x = mu[i].m10/mu[i].m00;
      float centroid_y = mu[i].m01/mu[i].m00;
      centroids[i] = cv::Point2f(centroid_x, centroid_y);
    }

    // draw contours
    cv::Mat drawing(canny_output.size(), CV_8UC3, cv::Scalar(255,255,255));
    
    for( int i = 0; i<contours.size(); i++ ) {
    cv::Scalar color = cv::Scalar(167,151,0); // B G R values
    cv::drawContours(drawing, contours, i, color, 2, 8, hierarchy, 0, cv::Point());
    cv::circle( drawing, mc[i], 4, color, -1, 8, 0 );
    }

    // showImage(drawing);

    //get box location in 2d image
    cv::Rect box_search_area((image_size_x/2), 0, (image_size_x/2), 255);
    cv::Point2f box_centroid = search_centroid_in_area(centroids, box_search_area);
    
    //get plate location in 2d image
    cv::Rect target_search_area(0, 0, (image_size_x/2), 255);
    cv::Point2f target_centroid = search_centroid_in_area(centroids, target_search_area);

    image_pub_.publish(cv_ptr->toImageMsg());
  }

  image_transport::ImageTransport it_;

  image_transport::Publisher image_pub_;
  image_transport::Subscriber camera_sub_;
  ros::Subscriber point_cloud_sub_;
};
