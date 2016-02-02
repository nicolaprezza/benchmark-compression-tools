#compute n-th Fibonacci string:
#F1 = a
#F2 = b
#Fn = Fn−1 Fn−2

n=$1

if (( $n==1 ))
then 
	Fn="0"
else
	if (( $n==2 ))
	then
		Fn="1"
	else
		Fn2="0"
		Fn1="1"

		for (( c=1;c<=n-2;c++ )); do

			Fn=$Fn1$Fn2

			Fn2=$Fn1
			Fn1=$Fn
		done
	fi
fi

printf $Fn
