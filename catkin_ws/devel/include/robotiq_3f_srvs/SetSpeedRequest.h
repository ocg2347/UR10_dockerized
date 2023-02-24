// Generated by gencpp from file robotiq_3f_srvs/SetSpeedRequest.msg
// DO NOT EDIT!


#ifndef ROBOTIQ_3F_SRVS_MESSAGE_SETSPEEDREQUEST_H
#define ROBOTIQ_3F_SRVS_MESSAGE_SETSPEEDREQUEST_H


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
struct SetSpeedRequest_
{
  typedef SetSpeedRequest_<ContainerAllocator> Type;

  SetSpeedRequest_()
    : speed(0)  {
    }
  SetSpeedRequest_(const ContainerAllocator& _alloc)
    : speed(0)  {
  (void)_alloc;
    }



   typedef uint8_t _speed_type;
  _speed_type speed;





  typedef boost::shared_ptr< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetSpeedRequest_

typedef ::robotiq_3f_srvs::SetSpeedRequest_<std::allocator<void> > SetSpeedRequest;

typedef boost::shared_ptr< ::robotiq_3f_srvs::SetSpeedRequest > SetSpeedRequestPtr;
typedef boost::shared_ptr< ::robotiq_3f_srvs::SetSpeedRequest const> SetSpeedRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator2> & rhs)
{
  return lhs.speed == rhs.speed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robotiq_3f_srvs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a29fd828fef714caa1fd63db675216db";
  }

  static const char* value(const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa29fd828fef714caULL;
  static const uint64_t static_value2 = 0xa1fd63db675216dbULL;
};

template<class ContainerAllocator>
struct DataType< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotiq_3f_srvs/SetSpeedRequest";
  }

  static const char* value(const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 speed\n"
;
  }

  static const char* value(const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetSpeedRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotiq_3f_srvs::SetSpeedRequest_<ContainerAllocator>& v)
  {
    s << indent << "speed: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTIQ_3F_SRVS_MESSAGE_SETSPEEDREQUEST_H