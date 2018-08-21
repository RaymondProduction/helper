# Bash scritps

The manual have only examples

### Variables

*string*

```bash
email='user@brizoit.com'
echo $email

```

Put value *'user@brizoit.com'* in string variable *email*. Next step you can look value of variable with help command *echo*. Near variable is symbol *$* to you can look value, else you look word "email"

*number* and  arithmetic operation

```bash
$a=5
let "b = $a + 2"
echo "b=$b"
```

### Function
Function which get JSON data. And it use two parametrs
```bash
generate_post_data()
{
cat <<EOF
{
    "name": "sprint $1",
    "startDate": "2018-04-11T15:22:00.000+10:00",
    "endDate": "2018-04-20T01:22:00.000+10:00",
    "originBoardId": $2
}
EOF
}
```

using function

```bash
echo "$(generate_post_data test 2)"
```

### Cycle


```bash
for ((i=<start>; i<=<final>; i++))
do
<script in cycle>
done
```

**Example**
```bash
cycle=5

for (( i=1; i <= cycle; i++ ))
do

curl --request POST \
  --url $url \
  --user $email:$token \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
let "progress = ($i*100/$cycle)"
echo "cycle  # $i $progress%"
done
```

