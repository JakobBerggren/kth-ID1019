defmodule Derivative do
	@type literal() :: {:const, number()}
					| {:const, atom()}
					| {:var, atom()}

	@type expr() :: {:add, expr(),expr()}
				| {:mul, expr(), expr()}
				| literal()

	def deriv({:const, _}, _) do
		{:const, 0}
	end
	
	def deriv({:var, v}, v) do
		{:const, 1}
	end

	def deriv({:var, y}, _) do
		{:var, y}
	end

	def deriv({:mul, e1, e2}, v) do
		eval({:add, 
		{:mul,{deriv(e1,v),e2},
		{:mul,{deriv(e2,v),e1}}}
		})
	end

	def deriv({:add, e1, e2}, v) do
		{:add ,deriv(e1,v), deriv(e2,v)}
	end

	def deriv({:pow, e1, {:const, n}}, v) do
		case e1 do
			{_,:x} -> {:mul, {:const, n}, {:pow, e1, n-1}}
			_ -> {:mul, {:const, n}, {:pow, deriv(e1,v), n-1}}
		end
	end

	def deriv({:ln, e1}, v) do 
		case e1 do
			{_,:x} -> {:div, {:const, 1}, e1}
			_ -> {:div, {:const, 1}, deriv(e1,v)}
		end
	end

	def deriv({:div, {:const, 1}, e1}, v) do
		 deriv({:pow, e1, {:const,-1}}, v)
	end

	def deriv({:sqrt, e1}, v) do
		deriv({:pow, e1, {:const, 1/2}}, v)
	end

	def deriv({:sin, e1}, v) do
		{:mul, deriv(e1, v), {:cos, e1}}
	end

	def eval({:mul, {:const, 0}, _}) do
		:kill
	end
	def eval({:mul, _, {:const, 0}}) do
		:kill
	end

	def eval(e1 = {:const,_}) do
		e1
	end

	def eval(e1 = {:var,_}) do
		e1
	end

	def eval({exp, e1, e2}) do
		{exp,eval(e1),eval(e2)}
	end
	def eval({_, e1}) do
		eval(e1)
	end



end