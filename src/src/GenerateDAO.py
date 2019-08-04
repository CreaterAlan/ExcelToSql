# -*- coding:utf-8 -*-
import os
from GenerateUtil import fromTableToPre,fromTableToPreSmall

def generateDAO(tabInfo,baseInfoMap):
    basePath = baseInfoMap["basePath"]
    DAOPackage = baseInfoMap["DAOPackage"]
    entityPackage = baseInfoMap["entityPackage"]
    entityTemplate = basePath + r"\template\DAOTemplate.txt"
    tableName = tabInfo["tableName"].lower()
    entityName = fromTableToPre(tableName)
    entityNameSmall = fromTableToPreSmall(tableName)

    #判断entity目录是否存在.如不存在则生成
    DAODir = basePath + r"\DAO"
    if not os.path.exists(DAODir):
        os.mkdir(DAODir)

    with open(entityTemplate,"r",encoding='utf-8') as resource:
        contents = resource.read()
        contents = contents.replace("{{DAOPackage}}",DAOPackage)
        contents = contents.replace("{{entityPackage}}",entityPackage)
        contents = contents.replace("{{entityName}}",entityName)
        contents = contents.replace("{{DAONameSmall}}",entityNameSmall + "DAO")
        contents = contents.replace("{{DAONameBig}}",str(entityName) + "DAO")


        with open(DAODir + r"\\" + entityName + "DAO.java","w",encoding='utf-8') as out:
            out.write(contents)

        print(entityName +"DAO has been generated")