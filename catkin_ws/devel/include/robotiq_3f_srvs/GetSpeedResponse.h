// Generated by gencpp from file robotiq_3f_srvs/GetSpeedResponse.msg
// DO NOT EDIT!


#ifndef ROBOTIQ_3F_SRVS_MESSAGE_GETSPEEDRESPONSE_H
#define ROBOTIQ_3F_SRVS_MESSAGE_GETSPEEDRESPONSE_H


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
struct GetSpeedResponse_
{
  typedef GetSpeedResponse_<ContainerAllocator> Type;

  GetSpeedResponse_()
    : speed(0)
    , success(false)  {
    }
  GetSpeedResponse_(const ContainerAllocator& _alloc)
    : speed(0)
    , success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _speed_type;
  _speed_type speed;

   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetSpeedResponse_

typedef ::robotiq_3f_srvs::GetSpeedResponse_<std::allocator<void> > GetSpeedResponse;

typedef boost::shared_ptr< ::robotiq_3f_srvs::GetSpeedResponse > GetSpeedResponsePtr;
typedef boost::shared_ptr< ::robotiq_3f_srvs::GetSpeedResponse const> GetSpeedResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator2> & rhs)
{
  return lhs.speed == rhs.speed &&
    lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robotiq_3f_srvs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6f5ae4e6edb4b56e87a35277f1b9993b";
  }

  static const char* value(const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6f5ae4e6edb4b56eULL;
  static const uint64_t static_value2 = 0x87a35277f1b9993bULL;
};

template<class ContainerAllocator>
struct DataType< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotiq_3f_srvs/GetSpeedResponse";
  }

  static const char* value(const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 speed\n"
"bool success\n"
"\n"
;
  }

  static const char* value(const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.speed);
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetSpeedResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotiq_3f_srvs::GetSpeedResponse_<ContainerAllocator>& v)
  {
    s << indent << "speed: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.speed);
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTIQ_3F_SRVS_MESSAGE_GETSPEEDRESPONSE_H