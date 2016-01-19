#compute n-th Fibonacci string:
#F1 = a
#F2 = b
#Fn = Fn−1 Fn−2

n=$1

if (( $n==1 ))
then 
	Fn="a"
else
	if (( $n==2 ))
	then
		Fn="b"
	else
		Fn2="a"
		Fn1="b"

		for (( c=1;c<=n-2;c++ )); do

			Fn=$Fn1$Fn2

			Fn2=$Fn1
			Fn1=$Fn
		done
	fi
fi

echo $Fn
