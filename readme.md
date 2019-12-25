# CHEEP TODO
![Bird](./bird.jpg)

## Description

Utilize the standard todo file format for your tasks and employ repeating tasks while using the original `todo` format 
outlined in `http://todotxt.org/`

The script is deployed to your `~/todo` directory; you wil have to create it the first time.

The folllowing script once installed in your crontab file will use awk to filter out any tasks that have the following 
context strings embedded in the text of the individual todo.
- @daily
- @weekly 
- @biweekly
- @bimonthly

The due dates for those tasks will be calculated based on the date the script was run. Those tasks are copied over to 
the `todo.txt` with their due dates altered. All completed tasks will be deleted from the `todo.txt` file after being 
copied over to the `done.txt` file.

## Usage
This solution is designed to be used with other software that conforms to the *todo.txt* standard. Here are the ones I use:

- Android:
[Android applicaiton](https://play.google.com/store/apps/details?id=net.c306.ttsuper&referrer=utm_source%3Dtodotxt_website%26utm_medium%3Dcommunity_apps)
- Browser:
[todo.txt for Chrome](https://chrome.google.com/webstore/detail/mndijfcodpjlhgjcpcbhncjakaboedbl)


The preferred approach is to run the script in a cron job so that it runs regularly and picks up the completed items 
that you tack on as your day progresses. 


```python
0,15,30,45 * * * * /~/ToDo/process.sh
```
The only proviso is that you don't allow auto-archive if you are using external programs to access your todo file, this 
behaviour is turned off so that the awk script will get the chance to run against a file that contains completed tasks.

### Warning
> When any of the above mentioned applications sets a task to done, an *x* is placed in the first column of the line as 
expected but the task priority gets removed and replaced with the metadata tag of `pri:`. The AWK script counts on the 
existence of this tag to be there when it performs it's processing. If you're using other software you can edit the AWK 
script to better conform to their behaviour

## Testing & Development
You can expand on the functionality by modifying the `todo.awk` file and changing the testmode variable to `true` and you
can test against the `todo.txt` and `done.txt` files that I have supplied.
