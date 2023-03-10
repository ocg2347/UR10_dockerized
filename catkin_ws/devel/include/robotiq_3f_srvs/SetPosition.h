// Generated by gencpp from file robotiq_3f_srvs/SetPosition.msg
// DO NOT EDIT!


#ifndef ROBOTIQ_3F_SRVS_MESSAGE_SETPOSITION_H
#define ROBOTIQ_3F_SRVS_MESSAGE_SETPOSITION_H

#include <ros/service_traits.h>


#include <robotiq_3f_srvs/SetPositionRequest.h>
#include <robotiq_3f_srvs/SetPositionResponse.h>


namespace robotiq_3f_srvs
{

struct SetPosition
{

typedef SetPositionRequest Request;
typedef SetPositionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetPosition
} // namespace robotiq_3f_srvs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robotiq_3f_srvs::SetPosition > {
  static const char* value()
  {
    return "1963b788318b4ab920816d8b79cff835";
  }

  static const char* value(const ::robotiq_3f_srvs::SetPosition&) { return value(); }
};

template<>
struct DataType< ::robotiq_3f_srvs::SetPosition > {
  static const char* value()
  {
    return "robotiq_3f_srvs/SetPosition";
  }

  static const char* value(const ::robotiq_3f_srvs::SetPosition&) { return value(); }
};


// service_traits::MD5Sum< ::robotiq_3f_srvs::SetPositionRequest> should match
// service_traits::MD5Sum< ::robotiq_3f_srvs::SetPosition >
template<>
struct MD5Sum< ::robotiq_3f_srvs::SetPositionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robotiq_3f_srvs::SetPosition >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::SetPositionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotiq_3f_srvs::SetPositionRequest> should match
// service_traits::DataType< ::robotiq_3f_srvs::SetPosition >
template<>
struct DataType< ::robotiq_3f_srvs::SetPositionRequest>
{
  static const char* value()
  {
    return DataType< ::robotiq_3f_srvs::SetPosition >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::SetPositionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robotiq_3f_srvs::SetPositionResponse> should match
// service_traits::MD5Sum< ::robotiq_3f_srvs::SetPosition >
template<>
struct MD5Sum< ::robotiq_3f_srvs::SetPositionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robotiq_3f_srvs::SetPosition >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::SetPositionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotiq_3f_srvs::SetPositionResponse> should match
// service_traits::DataType< ::robotiq_3f_srvs::SetPosition >
template<>
struct DataType< ::robotiq_3f_srvs::SetPositionResponse>
{
  static const char* value()
  {
    return DataType< ::robotiq_3f_srvs::SetPosition >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::SetPositionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOTIQ_3F_SRVS_MESSAGE_SETPOSITION_H
