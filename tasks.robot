# -*- coding: utf-8 -*-
*** Settings ***
Documentation   Template robot for sending POST Request to Telegram
Library         RPA.Robocloud.Secrets
Library         RPA.Notifier
Library         RPA.HTTP
Library         RPA.RobotLogListener
Library         MyLibrary


*** Variables ***
${chat_id}    123456789
${text}       Here goes the message from post, sended from Robocorp Lab
&{data}=      chat_id=${chat_id}    text=${text}

*** Tasks ***
Send Message to Telegram
    [Documentation]    ${\n} This code show how to make a POST Request to Telegram to send a message, but
    ...    in case of a failed attemp the token will be show in the Log generated unless you use
    ...    the keyword "Register Protected Keywords" like it is done here.
    ...    Also in case of a failed attemp in the console will show the url, therefore, showing your token.
    ...    If you want to prevent this you can use the keyword "Post with Secrets" to avoid it, this use
    ...    python library "resquest" to do the connection, so it don't shows the url in case of an error.
    
    # For "getMe" this don't actually works because I can't see the response, but this is just an example
    Register Protected Keywords    Post On Session
    Register Protected Keywords    Notify Telegram
    
    ${token}=    Get Secret    Telegram
    
    # Using Notify is far more easier
    Notify Telegram    Text send from Robocorp Lab    ${chat_id}    ${token}[Token]
        
    # Using a post request, more complicated, but, if you want to use more features from telegram this template will work
    Create Session    alias=Telegram    url=https://api.telegram.org   headers={"Content-Type": "application/json", "Host": "api.telegram.org"} 
    ...               timeout=5    verify=${CURDIR}${/}telegram_certificate.pem    max_retries=3    backoff_factor=0.5
    Post On Session    alias=Telegram    url=https://api.telegram.org/bot${token}[Token]/getMe
    Post On Session    alias=Telegram    url=https://api.telegram.org/bot${token}[Token]/sendMessage    json=${data}
    
    # Use this if you don't want the url with you API Token to be shown in case of an error
    # Thanks to Mika Hänninen (Mika / Robocorp for this suggestion)
    # These keywords are in Mylibrary.py
    ${result}=    Post With Secrets    url=https://api.telegram.org/bot${token}[Token]/getMe
    Log To Console    Result: ${result}
    ${result}=    Post With Secrets    url=https://api.telegram.org/bot${token}[Token]/sendMessage    json=${data}
    Log To Console    Result: ${result}
    Log    Done.


