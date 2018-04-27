# coding: utf-8

import tkinter
import threading
import os

import request

from tkinter import messagebox

PAD = " " * 10

def runInUiThread(f):
    top.after(1, f)

def showMessageAndEnableButton(x):
    def f():
        messagebox.showerror("Error", x)
        btnLogin.config(state="normal")
    return f
    
def loginSuccessful():
    frmLogin.pack_forget()
    frmStatus.pack(side=tkinter.TOP, expand=True)

_cur_status = ""
def updateStatus(x):
    global _cur_status
    if _cur_status == x: return
    def f():
        lblStatus.config(text='Status: %s' % x)
    runInUiThread(f)
    _cur_status = x

_logged_in = False

def tryLogin():
    try:
        if not (txtUsername.get().strip() and txtPassword.get().strip()):
            runInUiThread(showMessageAndEnableButton("All fields must be filled in."))
        else:
            resp = request.login(txtUsername.get(), txtPassword.get())
            if resp['error']:
                runInUiThread(showMessageAndEnableButton("An error occured: %s" % resp['message']))
            else:
                request.sessid = resp['sessid']
                _logged_in = True
                runInUiThread(loginSuccessful)
    except urllib.error.HTTPError:
        runInUiThread(showMessageAndEnableButton("A server error has occured. Please try again later."))
    except urllib.error.URLError:
        runInUiThread(showMessageAndEnableButton("Couldn't connect to the server. Please try again later."))
    except Exception as e:
        runInUiThread(showMessageAndEnableButton("An unknown error occured: %s." % repr(e)))

def btnLoginCallback():
    if _logged_in: return
    btnLogin.config(state="disabled")
    threading.Thread(target=tryLogin).start()

def keyLoginCallback(evt):
    if _logged_in: return
    btnLoginCallback()

top = tkinter.Tk()
top.title("TheZZAZZGlitch April Fools Event 2018 - Client application")
top.resizable(width=False, height=False)
top.geometry("500x250")
top.bind('<Return>', keyLoginCallback)

frmLogin = tkinter.Frame(top)
frmLogin.pack(side=tkinter.TOP, expand=True)
frmStatus = tkinter.Frame(top)

lblInfo = tkinter.Label(frmLogin, text="\n".join([
    "Welcome! This client application will help you connect to the event",
    "servers. To get started, enter your username and password below,",
    "and click 'Login'. Use your login details from the event site."
]), font="Verdana 10")
lblInfo.pack(side=tkinter.TOP, padx=10, pady=10)

frmUsername = tkinter.Frame(frmLogin)
frmUsername.pack(side=tkinter.TOP)
frmPassword = tkinter.Frame(frmLogin)
frmPassword.pack(side=tkinter.TOP)

lblUsername = tkinter.Label(frmUsername, text='Username: ', font="Verdana 10", width=12)
lblUsername.pack(side=tkinter.LEFT, pady=5)
txtUsername = tkinter.Entry(frmUsername, font="Verdana 10")
txtUsername.pack(side=tkinter.RIGHT, expand=tkinter.YES, fill=tkinter.X)

lblPassword = tkinter.Label(frmPassword, text='Password: ', font="Verdana 10", width=12)
lblPassword.pack(side=tkinter.LEFT, pady=8)
txtPassword = tkinter.Entry(frmPassword, font="Verdana 10", show="*")
txtPassword.pack(side=tkinter.RIGHT, expand=tkinter.YES, fill=tkinter.X)

btnLogin = tkinter.Button(frmLogin, text=PAD+"Login"+PAD, command=btnLoginCallback, font="Verdana 10 bold")
btnLogin.pack(side=tkinter.TOP, padx=10, pady=10)

lblSuccess = tkinter.Label(frmStatus, text="\n".join([
    "You have successfully logged in. You can now connect to",
    "127.0.0.1:8765 in your BGB emulator and start playing.",
    "Leave the application running. For further explanation,",
    "refer to the instructions on the event site.",
    "",
    "Have fun exploring the world of Glitchland!"
]), font="Verdana 10")
lblSuccess.pack(side=tkinter.TOP, padx=10, pady=10)

lblStatus = tkinter.Label(frmStatus, text='Status: Awaiting connection...', font="Verdana 10 bold")
lblStatus.pack(side=tkinter.TOP, padx=10, pady=10)

def start():
    top.mainloop()