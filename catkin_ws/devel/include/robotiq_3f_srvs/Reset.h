// Generated by gencpp from file robotiq_3f_srvs/Reset.msg
// DO NOT EDIT!


#ifndef ROBOTIQ_3F_SRVS_MESSAGE_RESET_H
#define ROBOTIQ_3F_SRVS_MESSAGE_RESET_H

#include <ros/service_traits.h>


#include <robotiq_3f_srvs/ResetRequest.h>
#include <robotiq_3f_srvs/ResetResponse.h>


namespace robotiq_3f_srvs
{

struct Reset
{

typedef ResetRequest Request;
typedef ResetResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Reset
} // namespace robotiq_3f_srvs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robotiq_3f_srvs::Reset > {
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::robotiq_3f_srvs::Reset&) { return value(); }
};

template<>
struct DataType< ::robotiq_3f_srvs::Reset > {
  static const char* value()
  {
    return "robotiq_3f_srvs/Reset";
  }

  static const char* value(const ::robotiq_3f_srvs::Reset&) { return value(); }
};


// service_traits::MD5Sum< ::robotiq_3f_srvs::ResetRequest> should match
// service_traits::MD5Sum< ::robotiq_3f_srvs::Reset >
template<>
struct MD5Sum< ::robotiq_3f_srvs::ResetRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robotiq_3f_srvs::Reset >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::ResetRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotiq_3f_srvs::ResetRequest> should match
// service_traits::DataType< ::robotiq_3f_srvs::Reset >
template<>
struct DataType< ::robotiq_3f_srvs::ResetRequest>
{
  static const char* value()
  {
    return DataType< ::robotiq_3f_srvs::Reset >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::ResetRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robotiq_3f_srvs::ResetResponse> should match
// service_traits::MD5Sum< ::robotiq_3f_srvs::Reset >
template<>
struct MD5Sum< ::robotiq_3f_srvs::ResetResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robotiq_3f_srvs::Reset >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::ResetResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotiq_3f_srvs::ResetResponse> should match
// service_traits::DataType< ::robotiq_3f_srvs::Reset >
template<>
struct DataType< ::robotiq_3f_srvs::ResetResponse>
{
  static const char* value()
  {
    return DataType< ::robotiq_3f_srvs::Reset >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::ResetResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOTIQ_3F_SRVS_MESSAGE_RESET_H