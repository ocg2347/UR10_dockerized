// Generated by gencpp from file robotiq_3f_srvs/SetPositionResponse.msg
// DO NOT EDIT!


#ifndef ROBOTIQ_3F_SRVS_MESSAGE_SETPOSITIONRESPONSE_H
#define ROBOTIQ_3F_SRVS_MESSAGE_SETPOSITIONRESPONSE_H


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
struct SetPositionResponse_
{
  typedef SetPositionResponse_<ContainerAllocator> Type;

  SetPositionResponse_()
    : success(false)  {
    }
  SetPositionResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SetPositionResponse_

typedef ::robotiq_3f_srvs::SetPositionResponse_<std::allocator<void> > SetPositionResponse;

typedef boost::shared_ptr< ::robotiq_3f_srvs::SetPositionResponse > SetPositionResponsePtr;
typedef boost::shared_ptr< ::robotiq_3f_srvs::SetPositionResponse const> SetPositionResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator1> & lhs, const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robotiq_3f_srvs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotiq_3f_srvs/SetPositionResponse";
  }

  static const char* value(const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
"\n"
;
  }

  static const char* value(const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetPositionResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotiq_3f_srvs::SetPositionResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTIQ_3F_SRVS_MESSAGE_SETPOSITIONRESPONSE_H
