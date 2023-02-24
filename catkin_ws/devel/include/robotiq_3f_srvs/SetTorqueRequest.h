// Generated by gencpp from file robotiq_3f_srvs/SetTorqueRequest.msg
// DO NOT EDIT!


#ifndef ROBOTIQ_3F_SRVS_MESSAGE_SETTORQUEREQUEST_H
#define ROBOTIQ_3F_SRVS_MESSAGE_SETTORQUEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robotiq_3f_srvs
{
template <class ContainerAllocator>
struct SetTorqueRequest_
{
  typedef SetTorqueRequest_<ContainerAllocator> Type;

  SetTorqueRequest_()
    : torque(0)  {
    }
  SetTorqueRequest_(const ContainerAllocator& _alloc)
    : torque(0)  {
  (void)_alloc;
    }



   typedef uint8_t _torque_type;
  _torque_type torque;





  typedef boost::shared_ptr< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetTorqueRequest_

typedef ::robotiq_3f_srvs::SetTorqueRequest_<std::allocator<void> > SetTorqueRequest;

typedef boost::shared_ptr< ::robotiq_3f_srvs::SetTorqueRequest > SetTorqueRequestPtr;
typedef boost::shared_ptr< ::robotiq_3f_srvs::SetTorqueRequest const> SetTorqueRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator2> & rhs)
{
  return lhs.torque == rhs.torque;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robotiq_3f_srvs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1dc7a4bffa7b02dcb0ce20e1a5e79267";
  }

  static const char* value(const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1dc7a4bffa7b02dcULL;
  static const uint64_t static_value2 = 0xb0ce20e1a5e79267ULL;
};

template<class ContainerAllocator>
struct DataType< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotiq_3f_srvs/SetTorqueRequest";
  }

  static const char* value(const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 torque\n"
;
  }

  static const char* value(const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.torque);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetTorqueRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotiq_3f_srvs::SetTorqueRequest_<ContainerAllocator>& v)
  {
    s << indent << "torque: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.torque);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTIQ_3F_SRVS_MESSAGE_SETTORQUEREQUEST_H