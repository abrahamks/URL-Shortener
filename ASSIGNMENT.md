
There are 4 main components to create the URL Shortener:
- Admin UI : Web UI for admin to shorten URLs, list the set of URLs they have shortened before, and total 
- Client (cr.sl) : Web application to receive and log user’s request to RabbitMQ
- RabbitMQ : Message-oriented middleware
- Rake : simple task runner to subscribe to RabbitMQ’s channel

The system is designed to be able to handle spikes in traffic without compromising statistics of each hit or click on the link. 

# Admin UI
Assumptions:
- all users can see the set of URLs the whole company have shortened before
- short and concise URLs = 1 to 5 digits 

###URL generated is guaranteed to be short and concise.
The system uses bijective function /one-to-one correspondence, where each element of one set (row id) is paired with exactly one element of the other set (short URLs). 

f(‘x’) = 123
g(‘123’) = x

It maps row id (base 10) to short URLs (base 62)
```0 → a
1 → b
... 
25 → z 
...
52 → 0
61 → 9```

`1000 → 8*62^0 + 16*62^1→ ‘iq’`

With maximum 5 digits-URL, the system can generate > 900M URLs 
(62^1 + 62^2 + 62^3 + 62^4 + 62^5) = 931,151,402

Pros: 
- URLs are guaranteed to be unique
- By using the same mathematical function, it could ‘decode’ back the short URL to row id

Cons:
- There is a chance it would generate abusive non-appropriate word combinations (e.g. row id = 4 → ‘shit’)

#Client
###Tracking
####Server-based tracking

Pros:
- Tracking is not dependent to user interaction, so client couldn’t block tracking

Cons:
- IP can be faked 
- User with dynamic IP (depends on ISP)
- Multiple computers / devices can have the same IP address

####Client-based tracking / cookie

Pros:
- Can track more attributes (e.g. location)

Cons:
- Cookie can be cleared / faked / blocked

### 301 / 302?
####Returns 302 to redirect page

Pros:
302 would force browser to check the shorten URL every time it loads the same URL (we can edit the long URL and browser would direct request to the new long URL).

Cons:
Not SEO-friendly

####301
Pros: 
SEO-friendly

Cons:
301 wouldn’t make browser to check the shorten URL every time. The browser would bypass the shorten URL and go directly to the long URL. As a consequence, if we make an edit to the long URL, the browser won’t see it directly. 301 would be more suitable for permanent website / subdomain / page migration (e.g. http://carousell.com/api/ to http://api.carousell.com.)

###Caching

####Using a variable instead of redis to save cache
Pros: simple
Cons: non-scalable

###Rake
Using prefetch = 10 to make a queue can be consumed among multiple workers
Write logs to database, so Admin UI can get how many clicks and unique clicks based on IP

