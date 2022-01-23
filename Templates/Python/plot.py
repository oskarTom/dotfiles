from matplotlib import pyplot as plt
import numpy as np

def main():
    x = np.arange(0,6,0.01)
    y = np.sin(x)
    plt.plot(x,y)
    plt.show()

if __name__ == "__main__":
    main()

