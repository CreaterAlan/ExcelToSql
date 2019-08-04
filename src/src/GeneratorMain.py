# -*- coding:utf-8 -*-
from GenerateUtil import getTableInfos,readConfig
from GenerateEntity import generateEntity
from GenerateDAO import generateDAO
from GenerateSQL import generateSQL

basePath = r"..\..\generator"
baseInfoMap = readConfig(basePath)
url = baseInfoMap["url"]
sheetName = baseInfoMap["sheetName"]
tableInfos = getTableInfos(url,sheetName)
for tableInfo in tableInfos:
    #generateEntity(tableInfo,baseInfoMap)
    #generateDAO(tableInfo,baseInfoMap)
    generateSQL(tableInfo,baseInfoMap)


