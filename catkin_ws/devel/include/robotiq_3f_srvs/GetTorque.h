// Generated by gencpp from file robotiq_3f_srvs/GetTorque.msg
// DO NOT EDIT!


#ifndef ROBOTIQ_3F_SRVS_MESSAGE_GETTORQUE_H
#define ROBOTIQ_3F_SRVS_MESSAGE_GETTORQUE_H

#include <ros/service_traits.h>


#include <robotiq_3f_srvs/GetTorqueRequest.h>
#include <robotiq_3f_srvs/GetTorqueResponse.h>


namespace robotiq_3f_srvs
{

struct GetTorque
{

typedef GetTorqueRequest Request;
typedef GetTorqueResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetTorque
} // namespace robotiq_3f_srvs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robotiq_3f_srvs::GetTorque > {
  static const char* value()
  {
    return "84acdc269d50ea8a59a1ba851600ccec";
  }

  static const char* value(const ::robotiq_3f_srvs::GetTorque&) { return value(); }
};

template<>
struct DataType< ::robotiq_3f_srvs::GetTorque > {
  static const char* value()
  {
    return "robotiq_3f_srvs/GetTorque";
  }

  static const char* value(const ::robotiq_3f_srvs::GetTorque&) { return value(); }
};


// service_traits::MD5Sum< ::robotiq_3f_srvs::GetTorqueRequest> should match
// service_traits::MD5Sum< ::robotiq_3f_srvs::GetTorque >
template<>
struct MD5Sum< ::robotiq_3f_srvs::GetTorqueRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robotiq_3f_srvs::GetTorque >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::GetTorqueRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotiq_3f_srvs::GetTorqueRequest> should match
// service_traits::DataType< ::robotiq_3f_srvs::GetTorque >
template<>
struct DataType< ::robotiq_3f_srvs::GetTorqueRequest>
{
  static const char* value()
  {
    return DataType< ::robotiq_3f_srvs::GetTorque >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::GetTorqueRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robotiq_3f_srvs::GetTorqueResponse> should match
// service_traits::MD5Sum< ::robotiq_3f_srvs::GetTorque >
template<>
struct MD5Sum< ::robotiq_3f_srvs::GetTorqueResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robotiq_3f_srvs::GetTorque >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::GetTorqueResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotiq_3f_srvs::GetTorqueResponse> should match
// service_traits::DataType< ::robotiq_3f_srvs::GetTorque >
template<>
struct DataType< ::robotiq_3f_srvs::GetTorqueResponse>
{
  static const char* value()
  {
    return DataType< ::robotiq_3f_srvs::GetTorque >::value();
  }
  static const char* value(const ::robotiq_3f_srvs::GetTorqueResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOTIQ_3F_SRVS_MESSAGE_GETTORQUE_H