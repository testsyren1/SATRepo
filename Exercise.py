#Exercise
class data:
    num1=10
    num2=20
    def add(self):
        self.res=self.num1+self.num2
        print("Sum=",self.res)
        return
    def sub(self):
        self.dif=self.num1-self.num2
        print("Subtraction=",self.dif)
        return
    def setData(self):
        self.num1=int(input("Enter first number="))
        self.num2=int(input("Enter second number="))
        return
    def showData(self):
        print("num1=", self.num1)
        print("num2=", self.num2)
        return

#main program
x=data()
x.add()
x.sub()
x.setData()
x.showData()

