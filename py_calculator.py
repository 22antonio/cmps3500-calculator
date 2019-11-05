# =====================================================
# Name: Antonio-Angel Medel & Joey Shafer
# CMPS 3500 HW 10
# build a scientific calculator in python
# GUI expected but not required
# =====================================================
# Requirements:
# Addition
# Subtracion
# Multiplication
# Division
# Sine - The input should be in degrees
# Cosine - The input should be in degrees
# Tangent - - The input should be in degrees
# Exponential
# Natural logarithm
# Square root (sqrt)
# Power of 2 (sq)
# Decimal point
# positive to negative change (+/-)
# Clear current input option (Clear)
# Cancel or reset the calculator option (Cancel)
# =====================================================
# TODO: I'm pretty sure I can simplify with Calculator class
# Class Claculator:
#
# TODO: add main GUI
# TODO: add basic actions
# TODO: add more complex actions

# import tkinter module for GUI
from tkinter import *

# global expression variable
expression = ""

# function to update text entry box


def press(num):
    global expression
    expression = expression + str(num)
    equation.set(expression)

# function to evalutate the final expression


def equalpress():
    # try and except statement used for handling
    # the errors like zero division error
    try:
        global expression
        # eval function evaluate the expression
        # and str function convert the result
        # into string
        total = str(eval(expression))
        equation.set(total)
        expression = ""
    except:
        equation.set(" error ")
        expression = ""

# function to clear the contents
# of text entry box


def clear():
    global expression
    expression = ""
    equation.set("")


# Driver coded
if __name__ == "__main__":
    # createa GUI window
    gui = Tk()
    # this is where the GUI design/configuration will go
