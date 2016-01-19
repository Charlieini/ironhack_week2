class Calculator
	def initialize(operator, first,second)
		@operator = operator
		@first = first
		@second = second
	end


def calculate
	@first.send(@operator,@second)
end

end
