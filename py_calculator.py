# =====================================================
# Name: Antonio-Angel Medel & Joey Shafer
# CMPS 3500 HW 10
# build a scientific calculator in python
# GUI expected but not required
# =====================================================
# Requirements:
# Addition &&
# Subtracion &&
# Multiplication &&
# Division &&
# Sine - The input should be in degrees &&
# Cosine - The input should be in degrees &&
# Tangent - - The input should be in degrees &&
# Exponential &&
# Natural logarithm &&
# Square root (sqrt) &&
# Power of 2 (sq) &&
# Decimal point &&
# positive to negative change (+/-) &&
# Clear current input option (Clear)
# Cancel or reset the calculator option (Cancel) &&
# =====================================================
# TODO: add clear
# TODO: positive to negative change

from tkinter import *       # used for gui
from tkinter import ttk
from math import *          # for all mathmatic operations


class Calculator:
    calc_value = 0.0
    div_trigger = False
    mult_trigger = False
    add_trigger = False
    sub_trigger = False
    asin_trigger = False
    acos_trigger = False
    atan_trigger = False
    exponential_trigger = False
    natural_log_trigger = False
    sqrt_trigger = False
    sq_trigger = False
    sign_trigger = False

    def button_press(self, value):
        entry_val = self.number_entry.get()
        entry_val += value
        self.number_entry.delete(0, "end")
        self.number_entry.insert(0, entry_val)

    def delete_button_press(self, value):
        self.number_entry.delete(0, "end")
        print("Cancel Pressed")

    def isfloat(self, str_val):
        try:
            float(str_val)
            return True
        except ValueError:
            return False

    def math_button_press(self, value):
        if self.isfloat(str(self.number_entry.get())):
            self.add_trigger = False
            self.sub_trigger = False
            self.mult_trigger = False
            self.div_trigger = False
            self.asin_trigger = False
            self.acos_trigger = False
            self.atan_trigger = False
            self.exponential_trigger = False
            self.natural_log_trigger = False
            self.sqrt_trigger = False
            self.sq_trigger = False
            self.sign_trigger = False
            self.calc_value = float(self.entry_value.get())
            if value == "/":
                print("/ Pressed")
                self.div_trigger = True
            elif value == "*":
                print("* pressed")
                self.mult_trigger = True
            elif value == "+":
                print("+ pressed")
                self.add_trigger = True
            elif value == "sin":
                print("sin pressed")
                self.asin_trigger = True
            elif value == "cos":
                print("cos pressed")
                self.acos_trigger = True
            elif value == "tan":
                print("tan pressed")
                self.atan_trigger = True
            elif value == "expo":
                print("exponential pressed")
                self.exponential_trigger = True
            elif value == "nlog":
                print("natural log pressed")
                self.natural_log_trigger = True
            elif value == "sqrt":
                print("square root pressed")
                self.sqrt_trigger = True
            elif value == "sq":
                print("power of 2 pressed")
                self.sq_trigger = True
            elif value == "+/-":
                print("sign_changed pressed")
                self.sign_trigger = True
            else:
                print("- Pressed")
                self.sub_trigger = True
            self.number_entry.delete(0, "end")

    def equal_button_press(self):
        if self.add_trigger or self.sub_trigger or self.mult_trigger or self.div_trigger or self.asin_trigger or self.acos_trigger or self.atan_trigger or self.exponential_trigger or self.natural_log_trigger or self.sqrt_trigger or self.sq_trigger or self.sign_trigger:

            if self.add_trigger:
                solution = self.calc_value + float(self.entry_value.get())
            elif self.sub_trigger:
                solution = self.calc_value - float(self.entry_value.get())
            elif self.mult_trigger:
                solution = self.calc_value * float(self.entry_value.get())
            elif self.asin_trigger:
                solution = sin(float(self.calc_value))
            elif self.acos_trigger:
                solution = cos(float(self.calc_value))
            elif self.atan_trigger:
                solution = tan(float(self.calc_value))
            elif self.exponential_trigger:
                solution = pow(float(self.calc_value),
                               float(self.entry_value.get()))
            elif self.natural_log_trigger:
                solution = log(float(self.calc_value))
            elif self.sqrt_trigger:
                solution = sqrt(float(self.calc_value))
            elif self.sq_trigger:
                solution = pow(float(self.calc_value), 2)
            elif self.sign_trigger:
                solution = float(self.calc_value) * -1
            else:
                solution = self.calc_value / float(self.entry_value.get())

            print(self.calc_value, " ", self.entry_value.get(), " ", solution)

            #
            self.number_entry.delete(0, "end")

            self.number_entry.insert(0, solution)

    def __init__(self, root):
        self.entry_value = StringVar(root, value="")
        root.title("Calculator")
        root.geometry("860x440")
        root.resizable(width=False, height=False)
        style = ttk.Style()
        style.configure("TButton",
                        font="Serif 15",
                        padding=10)

        style.configure("TEntry",
                        font="Serif 18",
                        padding=10)

        # Create the text entry box
        self.number_entry = ttk.Entry(root,
                                      textvariable=self.entry_value, width=50)
        self.number_entry.grid(row=0, columnspan=4)

        # ----- 1st Row -----

        self.button7 = ttk.Button(
            root, text="7", command=lambda: self.button_press('7')).grid(row=1, column=0)

        self.button8 = ttk.Button(
            root, text="8", command=lambda: self.button_press('8')).grid(row=1, column=1)

        self.button9 = ttk.Button(
            root, text="9", command=lambda: self.button_press('9')).grid(row=1, column=2)

        self.button_div = ttk.Button(
            root, text="/", command=lambda: self.math_button_press('/')).grid(row=1, column=3)

        # ----- 2nd Row -----

        self.button4 = ttk.Button(
            root, text="4", command=lambda: self.button_press('4')).grid(row=2, column=0)

        self.button5 = ttk.Button(
            root, text="5", command=lambda: self.button_press('5')).grid(row=2, column=1)

        self.button6 = ttk.Button(
            root, text="6", command=lambda: self.button_press('6')).grid(row=2, column=2)

        self.button_mult = ttk.Button(
            root, text="*", command=lambda: self.math_button_press('*')).grid(row=2, column=3)

        # ----- 3rd Row -----

        self.button1 = ttk.Button(
            root, text="1", command=lambda: self.button_press('1')).grid(row=3, column=0)

        self.button2 = ttk.Button(
            root, text="2", command=lambda: self.button_press('2')).grid(row=3, column=1)

        self.button3 = ttk.Button(
            root, text="3", command=lambda: self.button_press('3')).grid(row=3, column=2)

        self.button_add = ttk.Button(
            root, text="+", command=lambda: self.math_button_press('+')).grid(row=3, column=3)

        # ----- 4th Row -----

        self.button_cancel = ttk.Button(
            root, text="cancel", command=lambda: self.delete_button_press('cancel')).grid(row=4, column=0)

        self.button0 = ttk.Button(
            root, text="0", command=lambda: self.button_press('0')).grid(row=4, column=1)

        self.button_equal = ttk.Button(
            root, text="=", command=lambda: self.equal_button_press()).grid(row=4, column=2)

        self.button_sub = ttk.Button(
            root, text="-", command=lambda: self.math_button_press('-')).grid(row=4, column=3)

        # ------- 5th Row -------
        self.button_asin = ttk.Button(
            root, text="sin", command=lambda: self.math_button_press('sin')).grid(row=5, column=0)

        self.button_acos = ttk.Button(
            root, text="cos", command=lambda: self.math_button_press('cos')).grid(row=5, column=1)

        self.button_atan = ttk.Button(
            root, text="tan", command=lambda: self.math_button_press('tan')).grid(row=5, column=2)

        self.button_decimal = ttk.Button(
            root, text=".", command=lambda: self.button_press('.')).grid(row=5, column=3)

        # ------- 6th Row -------
        self.button_exponential = ttk.Button(
            root, text="^", command=lambda: self.math_button_press('expo')).grid(row=6, column=0)

        self.button_natural_log = ttk.Button(
            root, text="ln", command=lambda: self.math_button_press('nlog')).grid(row=6, column=1)

        self.button_sqrt = ttk.Button(
            root, text="sqrt", command=lambda: self.math_button_press('sqrt')).grid(row=6, column=2)

        self.button_sq = ttk.Button(
            root, text="^2", command=lambda: self.math_button_press('sq')).grid(row=6, column=3)

        # ------- 7th Row -------
        self.button_sign_change = ttk.Button(
            root, text="+/-", command=lambda: self.math_button_press('+/-')).grid(row=7, column=0)
        # self.button_clear = ttk.Button(
        #   root, text="clear", command=lambda: self.clear_button_press('clear')).grid(row=7, column=1)


root = Tk()

calc = Calculator(root)

root.mainloop()
