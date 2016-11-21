import tweepy

consumer_key = "0KhtNfMQMMeMLgHv8IoL0dvEr";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "ksLDeNKnuficSvoJGFi3BADPwA2hU0ftJgl9GXDzQY8SRMBsI0";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "738915750421766144-AfG6vzjj9ujHIhcEtWZDPtYKRwQT043";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "Kdtf5Tgofr0qMAlzd9KaMPNwxyUYEnK5R6CaOqmVOPpJl";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



