# -*- coding:utf-8 -*-
from GenerateUtil import fromTableToPre,dbType2Java,firstUpper
import os

def generateEntity(tabInfo,baseInfoMap):
    basePath = baseInfoMap["basePath"]
    entityPackage = baseInfoMap["entityPackage"]
    entityTemplate = basePath + r"\template\EntityTemplate.txt"

    tableName = tabInfo["tableName"].lower()
    entityName = fromTableToPre(tableName)
    children = tabInfo["children"]

    columnInfos = getColumInfos(children)
    getterSetters = getGetterSetters(children)

    #判断entity目录是否存在.如不存在则生成
    entityDir = basePath + r"\entity"
    if not os.path.exists(entityDir):
        os.mkdir(entityDir)

    with open(entityTemplate,"r",encoding='utf-8') as resource:
        contents = resource.read()
        contents = contents.replace("{{package}}",entityPackage)
        contents = contents.replace("{{tableName}}",tableName)
        contents = contents.replace("{{EntityName}}",entityName)
        contents = contents.replace("{{colums}}",columnInfos)
        contents = contents.replace("{{getterAndSetter}}",getterSetters)

        with open(entityDir + r"\\" + entityName + ".java","w",encoding='utf-8') as out:
            out.write(contents)

        print(entityName,": has generated...............")

#根据一列的信息生成表column属性信息
def getColumInfo(tableChild):
    columDesc = tableChild["columDesc"]
    columName = tableChild["columName"]
    columType = tableChild["columType"]
    javaType = dbType2Java(columType)

    result = []
    result.append("//" + columDesc)
    result.append('@Column(name = "'+columName+'")')
    result.append("private "+javaType+" "+columName+";")

    return result

#通过所有的children生成列的代码
def getColumInfos(children):
    result = ""
    for child in children:
        infos = getColumInfo(child)
        for info in infos:
            result = result + "    "+info + "\n"
        result = result + "\n"

    return result

#根据一列的信息生成表getter和setter属性信息
def getGetterSetter(tableChild):
    columDesc = tableChild["columDesc"]
    columName = tableChild["columName"]
    columType = tableChild["columType"]
    javaType = dbType2Java(columType)


    result = []
    result.append("public void set"+firstUpper(columName)+"("+javaType+" "+columName+") {this."+columName+" = "+columName+";}")
    result.append("public "+javaType+" get"+firstUpper(columName)+"() {	return "+columName+";}")


    return result

#通过所有的children生成getter和setter的代码
def getGetterSetters(children):
    result = ""
    for child in children:
        infos = getGetterSetter(child)
        for info in infos:
            result = result + "    "+info + "\n"
        result = result + "\n"

    return result

