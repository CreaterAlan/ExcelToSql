# -*- coding:utf-8-*-
import os

def generateSQL(tabInfo,baseInfoMap):
    basePath = baseInfoMap["basePath"]
    entityTemplate = basePath + r"\template\SQLTemplate.txt"
    tableName = tabInfo["tableName"].lower()
    children = tabInfo["children"]


    SQLDir = basePath + r"\SQL"
    if not os.path.exists(SQLDir):
        os.mkdir(SQLDir)

    sqlAttriButes = getSQLAttributes(children)
    commentValue =getSQLAttributes2(children)

    with open(entityTemplate,"r",encoding='utf-8') as resource:
        contents = resource.read()
        contents = contents.replace("{{tableName}}",tableName)
        contents = contents.replace("{{tableAttribute}}",sqlAttriButes)
        contents = contents.replace("{{tablecomment}}",commentValue)
        with open(SQLDir + r"\\" + "all" + ".sql","a",encoding='utf-8') as allOut:
            allOut.write(contents)
            allOut.write("\n")
            allOut.write("\n")

        with open(SQLDir + r"\\" + tableName + ".sql","w",encoding='utf-8') as out:
            out.write(contents)

        print(tableName," sql has been generated")


def getSQLAttribute(tableChild):
    columDesc = tableChild["columDesc"]
    columName = tableChild["columName"]
    columType = tableChild["columType"]
    columLength = tableChild["columLength"]
    columDecimal = tableChild["columDecimal"]
    nullStatus = tableChild["nullStatus"]
    defaultValue = tableChild["defaultValue"]
    Constraint = tableChild["Constraint"]
    dbType = dbType2Db(columType,columLength,columDecimal)
    defaultstatus = defaultMothod(defaultValue,nullStatus)
    #result =    "`"+columName.strip()+"` "+dbType+" NOT NULL COMMENT '"+columDesc+"',\n"
    result =    "`"+columName.strip()+"` "+dbType+" "+defaultstatus+" COMMENT '"+columDesc+"',\n"
    return result

def getSQLAttributes(children):
    result = ""
    for child in children:
        sql = getSQLAttribute(child)
        result  = result + sql
    return result

def dbType2Db(dbType,columLength,columDecimal):
    columLength=int(columLength)
    columDecimal=int(columDecimal)
    if columLength>0:
        if columDecimal>0:
            columLength = str(columLength)
            columDecimal = str(columDecimal)
            dbType = dbType+"("+columLength+","+columDecimal+")"
        else:
            columLength = str(columLength)
            dbType = dbType+"("+columLength+")"
    else:
        dbType = dbType
    return dbType

def defaultMothod(defaultValue,nullStatus):
    typekind = float
    if type(defaultValue) == typekind:
        defaultValue=int(defaultValue)
    defaultValue = str(defaultValue)
    defaultstatus=""
    if nullStatus == "":
        defaultstatus = defaultstatus+"NOT NULL"

    if defaultValue != "":
        defaultstatus = defaultstatus + " DEFAULT '"+defaultValue+"'"

    return defaultstatus

def getSQLAttributes2(children):
    result = ""
    for child in children:
        sql = getSQLAttribute2(child)
        result = result + sql
    result = "COMMENT='id:数据库主键  "+result+"'"
    return result

def getSQLAttribute2(tableChild):
    result=""
    columName = tableChild["columName"]
    Comment = tableChild["Comment"]
    if Comment != "" and  Comment != "备注":
        result = columName+":"+Comment + "   "
    return result