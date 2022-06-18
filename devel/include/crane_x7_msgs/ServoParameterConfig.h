//#line 2 "/opt/ros/noetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"
// *********************************************************
//
// File autogenerated for the crane_x7_msgs package
// by the dynamic_reconfigure package.
// Please do not edit.
//
// ********************************************************/

#ifndef __crane_x7_msgs__SERVOPARAMETERCONFIG_H__
#define __crane_x7_msgs__SERVOPARAMETERCONFIG_H__

#if __cplusplus >= 201103L
#define DYNAMIC_RECONFIGURE_FINAL final
#else
#define DYNAMIC_RECONFIGURE_FINAL
#endif

#include <dynamic_reconfigure/config_tools.h>
#include <limits>
#include <ros/node_handle.h>
#include <dynamic_reconfigure/ConfigDescription.h>
#include <dynamic_reconfigure/ParamDescription.h>
#include <dynamic_reconfigure/Group.h>
#include <dynamic_reconfigure/config_init_mutex.h>
#include <boost/any.hpp>

namespace crane_x7_msgs
{
  class ServoParameterConfigStatics;

  class ServoParameterConfig
  {
  public:
    class AbstractParamDescription : public dynamic_reconfigure::ParamDescription
    {
    public:
      AbstractParamDescription(std::string n, std::string t, uint32_t l,
          std::string d, std::string e)
      {
        name = n;
        type = t;
        level = l;
        description = d;
        edit_method = e;
      }
      virtual ~AbstractParamDescription() = default;

      virtual void clamp(ServoParameterConfig &config, const ServoParameterConfig &max, const ServoParameterConfig &min) const = 0;
      virtual void calcLevel(uint32_t &level, const ServoParameterConfig &config1, const ServoParameterConfig &config2) const = 0;
      virtual void fromServer(const ros::NodeHandle &nh, ServoParameterConfig &config) const = 0;
      virtual void toServer(const ros::NodeHandle &nh, const ServoParameterConfig &config) const = 0;
      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, ServoParameterConfig &config) const = 0;
      virtual void toMessage(dynamic_reconfigure::Config &msg, const ServoParameterConfig &config) const = 0;
      virtual void getValue(const ServoParameterConfig &config, boost::any &val) const = 0;
    };

    typedef boost::shared_ptr<AbstractParamDescription> AbstractParamDescriptionPtr;
    typedef boost::shared_ptr<const AbstractParamDescription> AbstractParamDescriptionConstPtr;

    // Final keyword added to class because it has virtual methods and inherits
    // from a class with a non-virtual destructor.
    template <class T>
    class ParamDescription DYNAMIC_RECONFIGURE_FINAL : public AbstractParamDescription
    {
    public:
      ParamDescription(std::string a_name, std::string a_type, uint32_t a_level,
          std::string a_description, std::string a_edit_method, T ServoParameterConfig::* a_f) :
        AbstractParamDescription(a_name, a_type, a_level, a_description, a_edit_method),
        field(a_f)
      {}

      T ServoParameterConfig::* field;

      virtual void clamp(ServoParameterConfig &config, const ServoParameterConfig &max, const ServoParameterConfig &min) const override
      {
        if (config.*field > max.*field)
          config.*field = max.*field;

        if (config.*field < min.*field)
          config.*field = min.*field;
      }

      virtual void calcLevel(uint32_t &comb_level, const ServoParameterConfig &config1, const ServoParameterConfig &config2) const override
      {
        if (config1.*field != config2.*field)
          comb_level |= level;
      }

      virtual void fromServer(const ros::NodeHandle &nh, ServoParameterConfig &config) const override
      {
        nh.getParam(name, config.*field);
      }

      virtual void toServer(const ros::NodeHandle &nh, const ServoParameterConfig &config) const override
      {
        nh.setParam(name, config.*field);
      }

      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, ServoParameterConfig &config) const override
      {
        return dynamic_reconfigure::ConfigTools::getParameter(msg, name, config.*field);
      }

      virtual void toMessage(dynamic_reconfigure::Config &msg, const ServoParameterConfig &config) const override
      {
        dynamic_reconfigure::ConfigTools::appendParameter(msg, name, config.*field);
      }

      virtual void getValue(const ServoParameterConfig &config, boost::any &val) const override
      {
        val = config.*field;
      }
    };

    class AbstractGroupDescription : public dynamic_reconfigure::Group
    {
      public:
      AbstractGroupDescription(std::string n, std::string t, int p, int i, bool s)
      {
        name = n;
        type = t;
        parent = p;
        state = s;
        id = i;
      }

      virtual ~AbstractGroupDescription() = default;

      std::vector<AbstractParamDescriptionConstPtr> abstract_parameters;
      bool state;

      virtual void toMessage(dynamic_reconfigure::Config &msg, const boost::any &config) const = 0;
      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, boost::any &config) const =0;
      virtual void updateParams(boost::any &cfg, ServoParameterConfig &top) const= 0;
      virtual void setInitialState(boost::any &cfg) const = 0;


      void convertParams()
      {
        for(std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = abstract_parameters.begin(); i != abstract_parameters.end(); ++i)
        {
          parameters.push_back(dynamic_reconfigure::ParamDescription(**i));
        }
      }
    };

    typedef boost::shared_ptr<AbstractGroupDescription> AbstractGroupDescriptionPtr;
    typedef boost::shared_ptr<const AbstractGroupDescription> AbstractGroupDescriptionConstPtr;

    // Final keyword added to class because it has virtual methods and inherits
    // from a class with a non-virtual destructor.
    template<class T, class PT>
    class GroupDescription DYNAMIC_RECONFIGURE_FINAL : public AbstractGroupDescription
    {
    public:
      GroupDescription(std::string a_name, std::string a_type, int a_parent, int a_id, bool a_s, T PT::* a_f) : AbstractGroupDescription(a_name, a_type, a_parent, a_id, a_s), field(a_f)
      {
      }

      GroupDescription(const GroupDescription<T, PT>& g): AbstractGroupDescription(g.name, g.type, g.parent, g.id, g.state), field(g.field), groups(g.groups)
      {
        parameters = g.parameters;
        abstract_parameters = g.abstract_parameters;
      }

      virtual bool fromMessage(const dynamic_reconfigure::Config &msg, boost::any &cfg) const override
      {
        PT* config = boost::any_cast<PT*>(cfg);
        if(!dynamic_reconfigure::ConfigTools::getGroupState(msg, name, (*config).*field))
          return false;

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = &((*config).*field);
          if(!(*i)->fromMessage(msg, n))
            return false;
        }

        return true;
      }

      virtual void setInitialState(boost::any &cfg) const override
      {
        PT* config = boost::any_cast<PT*>(cfg);
        T* group = &((*config).*field);
        group->state = state;

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = boost::any(&((*config).*field));
          (*i)->setInitialState(n);
        }

      }

      virtual void updateParams(boost::any &cfg, ServoParameterConfig &top) const override
      {
        PT* config = boost::any_cast<PT*>(cfg);

        T* f = &((*config).*field);
        f->setParams(top, abstract_parameters);

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          boost::any n = &((*config).*field);
          (*i)->updateParams(n, top);
        }
      }

      virtual void toMessage(dynamic_reconfigure::Config &msg, const boost::any &cfg) const override
      {
        const PT config = boost::any_cast<PT>(cfg);
        dynamic_reconfigure::ConfigTools::appendGroup<T>(msg, name, id, parent, config.*field);

        for(std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = groups.begin(); i != groups.end(); ++i)
        {
          (*i)->toMessage(msg, config.*field);
        }
      }

      T PT::* field;
      std::vector<ServoParameterConfig::AbstractGroupDescriptionConstPtr> groups;
    };

class DEFAULT
{
  public:
    DEFAULT()
    {
      state = true;
      name = "Default";
    }

    void setParams(ServoParameterConfig &config, const std::vector<AbstractParamDescriptionConstPtr> params)
    {
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator _i = params.begin(); _i != params.end(); ++_i)
      {
        boost::any val;
        (*_i)->getValue(config, val);

        if("return_delay_time"==(*_i)->name){return_delay_time = boost::any_cast<int>(val);}
        if("drive_mode"==(*_i)->name){drive_mode = boost::any_cast<int>(val);}
        if("operation_mode"==(*_i)->name){operation_mode = boost::any_cast<int>(val);}
        if("moving_threshold"==(*_i)->name){moving_threshold = boost::any_cast<int>(val);}
        if("homing_offset"==(*_i)->name){homing_offset = boost::any_cast<int>(val);}
        if("temprature_limit"==(*_i)->name){temprature_limit = boost::any_cast<int>(val);}
        if("max_vol_limit"==(*_i)->name){max_vol_limit = boost::any_cast<int>(val);}
        if("min_vol_limit"==(*_i)->name){min_vol_limit = boost::any_cast<int>(val);}
        if("current_limit"==(*_i)->name){current_limit = boost::any_cast<int>(val);}
        if("torque_enable"==(*_i)->name){torque_enable = boost::any_cast<bool>(val);}
        if("velocity_i_gain"==(*_i)->name){velocity_i_gain = boost::any_cast<int>(val);}
        if("velocity_p_gain"==(*_i)->name){velocity_p_gain = boost::any_cast<int>(val);}
        if("position_d_gain"==(*_i)->name){position_d_gain = boost::any_cast<int>(val);}
        if("position_i_gain"==(*_i)->name){position_i_gain = boost::any_cast<int>(val);}
        if("position_p_gain"==(*_i)->name){position_p_gain = boost::any_cast<int>(val);}
      }
    }

    int return_delay_time;
int drive_mode;
int operation_mode;
int moving_threshold;
int homing_offset;
int temprature_limit;
int max_vol_limit;
int min_vol_limit;
int current_limit;
bool torque_enable;
int velocity_i_gain;
int velocity_p_gain;
int position_d_gain;
int position_i_gain;
int position_p_gain;

    bool state;
    std::string name;

    
}groups;



//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int return_delay_time;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int drive_mode;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int operation_mode;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int moving_threshold;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int homing_offset;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int temprature_limit;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int max_vol_limit;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int min_vol_limit;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int current_limit;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      bool torque_enable;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int velocity_i_gain;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int velocity_p_gain;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int position_d_gain;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int position_i_gain;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      int position_p_gain;
//#line 231 "/opt/ros/noetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"

    bool __fromMessage__(dynamic_reconfigure::Config &msg)
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();

      int count = 0;
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        if ((*i)->fromMessage(msg, *this))
          count++;

      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); i ++)
      {
        if ((*i)->id == 0)
        {
          boost::any n = boost::any(this);
          (*i)->updateParams(n, *this);
          (*i)->fromMessage(msg, n);
        }
      }

      if (count != dynamic_reconfigure::ConfigTools::size(msg))
      {
        ROS_ERROR("ServoParameterConfig::__fromMessage__ called with an unexpected parameter.");
        ROS_ERROR("Booleans:");
        for (unsigned int i = 0; i < msg.bools.size(); i++)
          ROS_ERROR("  %s", msg.bools[i].name.c_str());
        ROS_ERROR("Integers:");
        for (unsigned int i = 0; i < msg.ints.size(); i++)
          ROS_ERROR("  %s", msg.ints[i].name.c_str());
        ROS_ERROR("Doubles:");
        for (unsigned int i = 0; i < msg.doubles.size(); i++)
          ROS_ERROR("  %s", msg.doubles[i].name.c_str());
        ROS_ERROR("Strings:");
        for (unsigned int i = 0; i < msg.strs.size(); i++)
          ROS_ERROR("  %s", msg.strs[i].name.c_str());
        // @todo Check that there are no duplicates. Make this error more
        // explicit.
        return false;
      }
      return true;
    }

    // This version of __toMessage__ is used during initialization of
    // statics when __getParamDescriptions__ can't be called yet.
    void __toMessage__(dynamic_reconfigure::Config &msg, const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__, const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__) const
    {
      dynamic_reconfigure::ConfigTools::clear(msg);
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->toMessage(msg, *this);

      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); ++i)
      {
        if((*i)->id == 0)
        {
          (*i)->toMessage(msg, *this);
        }
      }
    }

    void __toMessage__(dynamic_reconfigure::Config &msg) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();
      __toMessage__(msg, __param_descriptions__, __group_descriptions__);
    }

    void __toServer__(const ros::NodeHandle &nh) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->toServer(nh, *this);
    }

    void __fromServer__(const ros::NodeHandle &nh)
    {
      static bool setup=false;

      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->fromServer(nh, *this);

      const std::vector<AbstractGroupDescriptionConstPtr> &__group_descriptions__ = __getGroupDescriptions__();
      for (std::vector<AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); i++){
        if (!setup && (*i)->id == 0) {
          setup = true;
          boost::any n = boost::any(this);
          (*i)->setInitialState(n);
        }
      }
    }

    void __clamp__()
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      const ServoParameterConfig &__max__ = __getMax__();
      const ServoParameterConfig &__min__ = __getMin__();
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->clamp(*this, __max__, __min__);
    }

    uint32_t __level__(const ServoParameterConfig &config) const
    {
      const std::vector<AbstractParamDescriptionConstPtr> &__param_descriptions__ = __getParamDescriptions__();
      uint32_t level = 0;
      for (std::vector<AbstractParamDescriptionConstPtr>::const_iterator i = __param_descriptions__.begin(); i != __param_descriptions__.end(); ++i)
        (*i)->calcLevel(level, config, *this);
      return level;
    }

    static const dynamic_reconfigure::ConfigDescription &__getDescriptionMessage__();
    static const ServoParameterConfig &__getDefault__();
    static const ServoParameterConfig &__getMax__();
    static const ServoParameterConfig &__getMin__();
    static const std::vector<AbstractParamDescriptionConstPtr> &__getParamDescriptions__();
    static const std::vector<AbstractGroupDescriptionConstPtr> &__getGroupDescriptions__();

  private:
    static const ServoParameterConfigStatics *__get_statics__();
  };

  template <> // Max and min are ignored for strings.
  inline void ServoParameterConfig::ParamDescription<std::string>::clamp(ServoParameterConfig &config, const ServoParameterConfig &max, const ServoParameterConfig &min) const
  {
    (void) config;
    (void) min;
    (void) max;
    return;
  }

  class ServoParameterConfigStatics
  {
    friend class ServoParameterConfig;

    ServoParameterConfigStatics()
    {
ServoParameterConfig::GroupDescription<ServoParameterConfig::DEFAULT, ServoParameterConfig> Default("Default", "", 0, 0, true, &ServoParameterConfig::groups);
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.return_delay_time = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.return_delay_time = 254;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.return_delay_time = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("return_delay_time", "int", 0, "Return Delay time", "", &ServoParameterConfig::return_delay_time)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("return_delay_time", "int", 0, "Return Delay time", "", &ServoParameterConfig::return_delay_time)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.drive_mode = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.drive_mode = 1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.drive_mode = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("drive_mode", "int", 0, "Drive Mode", "", &ServoParameterConfig::drive_mode)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("drive_mode", "int", 0, "Drive Mode", "", &ServoParameterConfig::drive_mode)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.operation_mode = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.operation_mode = 5;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.operation_mode = 3;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("operation_mode", "int", 0, "Operating Mode", "", &ServoParameterConfig::operation_mode)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("operation_mode", "int", 0, "Operating Mode", "", &ServoParameterConfig::operation_mode)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.moving_threshold = 10;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.moving_threshold = 1023;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.moving_threshold = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("moving_threshold", "int", 0, "Moving Threshold", "", &ServoParameterConfig::moving_threshold)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("moving_threshold", "int", 0, "Moving Threshold", "", &ServoParameterConfig::moving_threshold)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.homing_offset = -1044479;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.homing_offset = 1044479;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.homing_offset = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("homing_offset", "int", 0, "Homing Offset", "", &ServoParameterConfig::homing_offset)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("homing_offset", "int", 0, "Homing Offset", "", &ServoParameterConfig::homing_offset)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.temprature_limit = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.temprature_limit = 100;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.temprature_limit = 80;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("temprature_limit", "int", 0, "Temprature Limit", "", &ServoParameterConfig::temprature_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("temprature_limit", "int", 0, "Temprature Limit", "", &ServoParameterConfig::temprature_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.max_vol_limit = 95;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.max_vol_limit = 160;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.max_vol_limit = 160;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("max_vol_limit", "int", 0, "Max Voltage Limit", "", &ServoParameterConfig::max_vol_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("max_vol_limit", "int", 0, "Max Voltage Limit", "", &ServoParameterConfig::max_vol_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.min_vol_limit = 95;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.min_vol_limit = 160;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.min_vol_limit = 95;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("min_vol_limit", "int", 0, "Min Voltage Limit", "", &ServoParameterConfig::min_vol_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("min_vol_limit", "int", 0, "Min Voltage Limit", "", &ServoParameterConfig::min_vol_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.current_limit = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.current_limit = 1193;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.current_limit = 1193;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("current_limit", "int", 0, "Current Limit", "", &ServoParameterConfig::current_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("current_limit", "int", 0, "Current Limit", "", &ServoParameterConfig::current_limit)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.torque_enable = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.torque_enable = 1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.torque_enable = 1;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<bool>("torque_enable", "bool", 0, "Torque Enable", "", &ServoParameterConfig::torque_enable)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<bool>("torque_enable", "bool", 0, "Torque Enable", "", &ServoParameterConfig::torque_enable)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.velocity_i_gain = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.velocity_i_gain = 16383;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.velocity_i_gain = 1920;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("velocity_i_gain", "int", 0, "Velocity I Gain", "", &ServoParameterConfig::velocity_i_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("velocity_i_gain", "int", 0, "Velocity I Gain", "", &ServoParameterConfig::velocity_i_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.velocity_p_gain = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.velocity_p_gain = 16383;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.velocity_p_gain = 100;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("velocity_p_gain", "int", 0, "Velocity P Gain", "", &ServoParameterConfig::velocity_p_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("velocity_p_gain", "int", 0, "Velocity P Gain", "", &ServoParameterConfig::velocity_p_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.position_d_gain = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.position_d_gain = 16383;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.position_d_gain = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("position_d_gain", "int", 0, "Position D Gain", "", &ServoParameterConfig::position_d_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("position_d_gain", "int", 0, "Position D Gain", "", &ServoParameterConfig::position_d_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.position_i_gain = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.position_i_gain = 16383;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.position_i_gain = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("position_i_gain", "int", 0, "Position I Gain", "", &ServoParameterConfig::position_i_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("position_i_gain", "int", 0, "Position I Gain", "", &ServoParameterConfig::position_i_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __min__.position_p_gain = 0;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __max__.position_p_gain = 16383;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __default__.position_p_gain = 800;
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.abstract_parameters.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("position_p_gain", "int", 0, "Position P Gain", "", &ServoParameterConfig::position_p_gain)));
//#line 291 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __param_descriptions__.push_back(ServoParameterConfig::AbstractParamDescriptionConstPtr(new ServoParameterConfig::ParamDescription<int>("position_p_gain", "int", 0, "Position P Gain", "", &ServoParameterConfig::position_p_gain)));
//#line 246 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      Default.convertParams();
//#line 246 "/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py"
      __group_descriptions__.push_back(ServoParameterConfig::AbstractGroupDescriptionConstPtr(new ServoParameterConfig::GroupDescription<ServoParameterConfig::DEFAULT, ServoParameterConfig>(Default)));
//#line 369 "/opt/ros/noetic/share/dynamic_reconfigure/cmake/../templates/ConfigType.h.template"

      for (std::vector<ServoParameterConfig::AbstractGroupDescriptionConstPtr>::const_iterator i = __group_descriptions__.begin(); i != __group_descriptions__.end(); ++i)
      {
        __description_message__.groups.push_back(**i);
      }
      __max__.__toMessage__(__description_message__.max, __param_descriptions__, __group_descriptions__);
      __min__.__toMessage__(__description_message__.min, __param_descriptions__, __group_descriptions__);
      __default__.__toMessage__(__description_message__.dflt, __param_descriptions__, __group_descriptions__);
    }
    std::vector<ServoParameterConfig::AbstractParamDescriptionConstPtr> __param_descriptions__;
    std::vector<ServoParameterConfig::AbstractGroupDescriptionConstPtr> __group_descriptions__;
    ServoParameterConfig __max__;
    ServoParameterConfig __min__;
    ServoParameterConfig __default__;
    dynamic_reconfigure::ConfigDescription __description_message__;

    static const ServoParameterConfigStatics *get_instance()
    {
      // Split this off in a separate function because I know that
      // instance will get initialized the first time get_instance is
      // called, and I am guaranteeing that get_instance gets called at
      // most once.
      static ServoParameterConfigStatics instance;
      return &instance;
    }
  };

  inline const dynamic_reconfigure::ConfigDescription &ServoParameterConfig::__getDescriptionMessage__()
  {
    return __get_statics__()->__description_message__;
  }

  inline const ServoParameterConfig &ServoParameterConfig::__getDefault__()
  {
    return __get_statics__()->__default__;
  }

  inline const ServoParameterConfig &ServoParameterConfig::__getMax__()
  {
    return __get_statics__()->__max__;
  }

  inline const ServoParameterConfig &ServoParameterConfig::__getMin__()
  {
    return __get_statics__()->__min__;
  }

  inline const std::vector<ServoParameterConfig::AbstractParamDescriptionConstPtr> &ServoParameterConfig::__getParamDescriptions__()
  {
    return __get_statics__()->__param_descriptions__;
  }

  inline const std::vector<ServoParameterConfig::AbstractGroupDescriptionConstPtr> &ServoParameterConfig::__getGroupDescriptions__()
  {
    return __get_statics__()->__group_descriptions__;
  }

  inline const ServoParameterConfigStatics *ServoParameterConfig::__get_statics__()
  {
    const static ServoParameterConfigStatics *statics;

    if (statics) // Common case
      return statics;

    boost::mutex::scoped_lock lock(dynamic_reconfigure::__init_mutex__);

    if (statics) // In case we lost a race.
      return statics;

    statics = ServoParameterConfigStatics::get_instance();

    return statics;
  }


}

#undef DYNAMIC_RECONFIGURE_FINAL

#endif // __SERVOPARAMETERRECONFIGURATOR_H__
