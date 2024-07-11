import math

class Circle:
    def __init__(self, radius):
        self.radius = radius

    def getArea(self):
        return math.pi * (self.radius**2)
    
    def getPerimeter(self):
        return 2 * math.pi * self.radius
    

def main():
    circle = Circle(3)
    print(circle.getArea())
    print(circle.getPerimeter())

if __name__ == "__main__":
    main()
            