from tkinter import *
import tkinter
from tkinter import ttk
from PIL import ImageTk, Image
from tkinter import messagebox, filedialog
import psycopg2
from random import choice
from string import ascii_uppercase
from decimal import Decimal


DB_HOST ='localhost'
DB_NAME='airres'
DB_USER='postgres'
DB_PASS= '123456'

conn= psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)
cur= conn.cursor()

root =tkinter.Tk()  
var = tkinter.IntVar()
root.title('Airport Reservation System')
#root.geometry("500x300")

def registerClick():
    top= Toplevel()
    top.title("Book Your Flight")
    flightFrame = LabelFrame(top, text="", padx=20, pady=20)
    flightFrame.pack(padx=10, pady=10)
    mainLabel = Label(flightFrame, text="Book Your Trip").grid(row=1, column=1)
    destinationlabel = Label(flightFrame, text="Destination: ").grid(row=2, column=0)
    fromlabel = Label(flightFrame, text="From").grid(row=3, column=0)
    fromEntry = Entry(flightFrame, width=15)
    fromEntry.grid(row=3, column=1)
    tolabel = Label(flightFrame, text="To").grid(row=3, column=2)
    toEntry = Entry(flightFrame, width=15)
    toEntry.grid(row=3, column=3)
    numbertravellers = Label(flightFrame, text="No. of travellers ").grid(row=4, column=0, padx=(20, 0), pady=(10, 10))
    travellersEntry = Entry(flightFrame, width=10)
    travellersEntry.grid(row=4, column=1, pady=(10, 10))
    #non-stop
  
    nonstop = tkinter.Checkbutton(flightFrame, text="Non-Stop", variable=var).grid(row=5, column=0, padx=(40,0))
    dateslabel = Label(flightFrame, text="Date: ", justify=LEFT).grid(sticky="w", row=6, column=0, padx=(25,0))
    #fromdateslabel = Label(flightFrame, text="From").grid(row=7, column=0)
    datesEntry = Entry(flightFrame, width=15)
    datesEntry.grid(row=6, column=1)
    emaiLabel= Label(flightFrame, text="Email ID").grid(row=7, column=0)
    emaiEntry= Entry(flightFrame, width=30)
    emaiEntry.grid(row=7, column=1)

    def searchClick():
        #top= Toplevel()
        fro =  fromEntry.get()
        to = toEntry.get()
        travellers = travellersEntry.get()
        nonstop = var.get()
        dates = datesEntry.get()
        emai = emaiEntry.get()

        messagebox.showinfo("Confirmed","Succesfully booked your flight")
        if nonstop == 1:
            conn= psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)
            cur= conn.cursor()
            emai = emaiEntry.get()
            sel_1 = ("SELECT acode from airport where city = %s")
            mat_1=(fro,)
            cur.execute(sel_1, mat_1)
            dep_airp = cur.fetchone()
            sel_2 = ("SELECT a_dep_time from arrives_at where date(a_dep_time) = %s and acode = %s")
            mat_2=(dates,dep_airp)
            cur.execute(sel_2, mat_2) 
            dep_time = cur.fetchone()
            sel_3 = ("SELECT acode from airport where city = %s")
            mat_3=(to,)
            cur.execute(sel_3, mat_3)
            arr_airp = cur.fetchone()
            sel_4 = ("SELECT arr_time from stops_at where acode = %s")
            mat_4=(arr_airp,)
            cur.execute(sel_4, mat_4)
            arr_time = cur.fetchone()
            tripid = ''.join(choice(ascii_uppercase) for i in range(7))
            no_trav = travellers
            sel_5 = ("SELECT s.aplaneno from arrives_at a, stops_at s where a.aplaneno=s.aplaneno and a.acode=%s and s.acode=%s and stop_no=1 and date(a_dep_time)=%s")
            mat_5 = (dep_airp, arr_airp, dates)
            cur.execute(sel_5, mat_5)
            planecode = cur.fetchone()
            upquery= """update stops_at set availability= availability-%s where aplaneno=%s and stop_no<=2"""
            reco=(no_trav, planecode)
            cur.execute(upquery, reco)
            tranid = ''.join(choice(ascii_uppercase) for i in range(4))
            sel_6 = ("SELECT dist from stops_at where acode = %s and aplaneno = %s")
            mat_6=(arr_airp, planecode)
            cur.execute(sel_6, mat_6)
            b= cur.fetchone()
            baseamt = round((100*float(travellers)*float(b[0])),2)
            currency = "Rs."
            discount = round((0.15*baseamt),2)
            tax= round((0.1*baseamt),2)
            totamt= round((baseamt+tax-discount),2)
            insquery= """insert into flight_trip values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            rec=(emai, dep_airp, dep_time, arr_airp, arr_time, tripid, no_trav, totamt, tax, tranid, currency, baseamt, discount, planecode)
            cur.execute(insquery,rec)
            conn.commit()
            cur.close()
            conn.close()

            fromEntry.delete(0, END)
            toEntry.delete(0, END)
            travellersEntry.delete(0, END)
            datesEntry.delete(0, END)
            emailEntry.delete(0, END)

        if nonstop == 0:
            conn= psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)
            cur= conn.cursor()
            emai = emaiEntry.get()
            sel_1 = ("SELECT acode from airport where city = %s")
            mat_1=(fro,)
            cur.execute(sel_1, mat_1)
            dep_airp = cur.fetchone()
            sel_2 = ("SELECT a_dep_time from arrives_at where date(a_dep_time) = %s and acode = %s")
            mat_2=(dates,dep_airp)
            cur.execute(sel_2, mat_2) 
            dep_time = cur.fetchone()
            sel_3 = ("SELECT acode from airport where city = %s")
            mat_3=(to,)
            cur.execute(sel_3, mat_3)
            arr_airp = cur.fetchone()
            sel_4 = ("SELECT arr_time from stops_at where acode = %s")
            mat_4=(arr_airp,)
            cur.execute(sel_4, mat_4)
            arr_time = cur.fetchone()
            tripid = ''.join(choice(ascii_uppercase) for i in range(7))
            #tripid = "rit16"
            no_trav = travellers
            sel_5 = ("SELECT s.aplaneno from arrives_at a, stops_at s where a.aplaneno=s.aplaneno and a.acode=%s and s.acode=%s and date(a_dep_time)=%s")
            mat_5 = (dep_airp, arr_airp, dates)
            cur.execute(sel_5, mat_5)
            planecode = cur.fetchone()
            upquery= """update stops_at set availability= availability-%s where aplaneno=%s and stop_no<=2"""
            reco=(no_trav, planecode)
            cur.execute(upquery, reco)
            tranid = ''.join(choice(ascii_uppercase) for i in range(4))
            #tranid = "2345"
            sel_6 = ("SELECT dist from stops_at where acode = %s and aplaneno = %s")
            mat_6=(arr_airp, planecode)
            cur.execute(sel_6, mat_6)
            b= cur.fetchone()
            baseamt = round((100*float(travellers)*float(b[0])),2)
            currency = "Rs."
            discount = round((0.15*baseamt),2)
            tax= round((0.1*baseamt),2)
            totamt= round((baseamt+tax-discount),2)
            insquery= """insert into flight_trip values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            rec=(emai, dep_airp, dep_time, arr_airp, arr_time, tripid, no_trav, totamt, tax, tranid, currency, baseamt, discount, planecode)
            cur.execute(insquery,rec)
            conn.commit()
            cur.close()
            conn.close()

            fromEntry.delete(0, END)
            toEntry.delete(0, END)
            travellersEntry.delete(0, END)
            datesEntry.delete(0, END)

    bookButton= Button(flightFrame, text="Book", command= searchClick)
    bookButton.grid(row=8, column=1, pady=(10,10))
    fname = fNameEntry.get()
    lname = lNameEntry.get()
    email = emailEntry.get()
    phno = phoneEntry.get()

    insertquery= """insert into user1 values (%s, %s, %s, %s)"""
    record=(fname, lname, email, phno)
    cur.execute(insertquery,record)
    conn.commit()
    cur.close()
    conn.close()

    fNameEntry.delete(0, END)
    lNameEntry.delete(0, END)
    emailEntry.delete(0, END)
    phoneEntry.delete(0, END)

    messagebox.showinfo("Info added","Succesfully added user details")
    

#flightFrame
flightFrame =LabelFrame(root, text="", padx=20, pady=20)
flightFrame.pack(padx=10, pady=10)
mainLabel= Label(flightFrame, text="Airport Reservation System").grid(row=1, column=2)
#landingimg =ImageTk.PhotoImage(Image.open("icon.png"))
#landinglabel= Label(flightFrame, image=landingimg).grid(row=2, column=2)

fNameLabel= Label(flightFrame, text="First Name").grid(row=2, column=1)
fNameEntry= Entry(flightFrame, width=30)
fNameEntry.grid(row=2, column=2)

lNameLabel= Label(flightFrame, text="Last Name").grid(row=3, column=1)
lNameEntry= Entry(flightFrame, width=30)
lNameEntry.grid(row=3, column=2)

emailLabel= Label(flightFrame, text="Email ID").grid(row=4, column=1)
emailEntry= Entry(flightFrame, width=30)
emailEntry.grid(row=4, column=2)

phoneLabel= Label(flightFrame, text="Phone Number").grid(row=5, column=1)
phoneEntry= Entry(flightFrame, width=30)
phoneEntry.grid(row=5, column=2)

registerButton= Button(flightFrame, text="Register", command= registerClick)
registerButton.grid(row=8, column=2)
root.mainloop()
