defmodule Test do

	#Compute the double of a number
	def double(n) do
		IO.puts(n*2)
	end

	#Convert Fahrenheit to Celsius
	def fahren(n) do
		IO.puts((n-32)/1.8)
	end

	#Recursive multiplication
	def product(m,n) do
		if m == 0 do
			0
		else
			n+product(m-1,n)
		end
	end

	#Recursive exponential
	def exp(x,n) do
		case n do
			0-> 1
			n->product(x,exp(x,n-1))
		end
	end

	#Recursive n'th element from list
	def nth(n,l) do
		[head|tail] = l
		if n==0 do
			head
		else
			nth(n-1,tail)
		end
	end

	#Recursive length of list
	def len(l,n) do 
		[head|tail] = l 
		if(tail == []) do
			n+1
		else
			len(tail,(n+1))
		end
	end

	#Recursive sum of elements in list
	def sum(l,n) do
		[head|tail] = l
		if(tail == []) do
			n+head
		else
			sum(tail,(n+head))
		end
	end

	#Recursive duplicate of all elements in list
	def duplicate(l) do 
		if(tl(l) != []) do
			[hd(l)|[hd(l) | duplicate(tl(l))]]

		else
			[hd(l)|l]
		end
	end

	#Recurive add of an element to list
	def add(x, l) do add(x, l, l) end
    def add(x, [], _) do [x] end
    def add(x, [x | _], l) do l end
    def add(x, [head | []], l) do l ++ [x] end
    def add(x, [head | tail], l) do add(x, tail, l) end

end