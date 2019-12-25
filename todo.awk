BEGIN {
    #Constants that will be needed

    DAY=86400
    WEEK=DAY*7
    BIWEEK=WEEK*2
    MONTH=DAY*30
}


/^x.*@daily / {

	new_date=strftime("%Y-%m-%d ", systime()+DAY)
	duePosition=find_field_with("due")
	priPosition=find_field_with("pri")
    printf make_priority_field($priPosition)
	printf strftime("%Y-%m-%d ", systime())

	$duePosition="due:" new_date
	$priPosition=""

	#print out all the fields except for the first 3 starting at 4
	print_all_fields(4)

	}

/^x.*@weekly / {

	new_date=strftime("%Y-%m-%d ", systime()+WEEK)
	duePosition=find_field_with("due")
	priPosition=find_field_with("pri")
    printf make_priority_field($priPosition)
    printf strftime("%Y-%m-%d ", systime())


	$duePosition="due:" new_date
	$priPosition=""

	#print out all the fields except for the first 3 starting at 4
	print_all_fields(4)

	}

/^x.*@biweekly / {

	new_date=strftime("%Y-%m-%d ", systime()+BIWEEK)
	duePosition=find_field_with("due")
	priPosition=find_field_with("pri")
    printf make_priority_field($priPosition)
	printf strftime("%Y-%m-%d ", systime())

	$duePosition="due:" new_date
	$priPosition=""

	#print out all the fields except for the first 3 starting at 4
	print_all_fields(4)
	}

/^x.*@monthly / {

	new_date=strftime("%Y-%m-%d ", systime()+MONTH)
	duePosition=find_field_with("due")
	priPosition=find_field_with("pri")
    printf make_priority_field($priPosition)
	printf strftime("%Y-%m-%d ", systime())

	$duePosition="due:" new_date
	$priPosition=""

	#print out all the fields except for the first 3 starting at 4
	print_all_fields(4)
	}

function print_all_fields(start) {
	for(i=start;i<=NF;i++) {
	    printf $i " "
	    }
	printf "\n"
}

function find_field_with(target){
    targPosition = 0
	for(i=0;i<=NF;i++) {
	    if (match($i, target)) {
	        targPosition = i
	        }
	    }
	return targPosition
}

function make_priority_field(fld) {
	return "("substr(fld,length(fld))") "
}
