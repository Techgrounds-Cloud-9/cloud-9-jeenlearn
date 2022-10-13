y=1
while y != 100:
    x=input("Please enter a number :")
    if(int(x) < 100):
        print(x+" is pretty low, isnt it?")
    elif(int(x) > 100):
        print("Wow! "+x+" is a big number ")
    else:
        print(x+ " is a nice number indeed!")
        y=100
        