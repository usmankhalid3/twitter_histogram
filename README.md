Twitter Histogram
==================

This program collects all the tweets from a user account and organizes them by hour of the day. Returns an array of tweet counts during each hour and also the hour that the user is most active in (i.e. tweets the most).

**Setup**

1. Execute the following command to install dependencies
	

    *bundle install*

2. Execute the following command to run test suite

    *rake* 

3. Execute the following command to run the app

    *rackup*

4. Access the app on port 9292

**Endpoints**

1. */* -> This will respond with 'Try /hello/:name'
2. */hello/:barrackObama* -> This will respond with 'Hello, BarrackObama'
3. */histogram/Ferrari* -> This will return a JSON structure with tweet counts for each hour of the day and the duration during which the user is most active (i.e. tweets the most).

**Limitations**

Due to limitation of the twitter REST API, we can only build the histogram based on the most recent ~3200 tweets by a user. Read more here: https://dev.twitter.com/rest/reference/get/statuses/user_timeline