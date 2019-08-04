# -*- coding:utf-8-*-
#print('\n'.join([''.join([('FuckFuckFuck'[(x-y)%12]if((x*0.05)**2+(y*0.1)**2-1)**3-(x*0.05)**2*(y*0.1)**3<=0 else' ')for x in range(-30,30)])for y in range(15,-15,-1)]))
import xlrd

typeMap = {}
typeMap["varchar"] = "String"
typeMap["datetime"] = "Date"
typeMap["int"] = "Integer"
typeMap["bit"] = "Boolean"
typeMap["decimal"] = "BigDecimal"
typeMap["longtext"] = "String"
typeMap["bigint"] = "Long"
typeMap["float"] = "Float"
typeMap["date"] = "Date"

#读取某个excel的某个sheet 返回所有表的Map
def getTableInfos(url,sheetName):
    workbook = xlrd.open_workbook(url)
    sheet_names= workbook.sheet_names()
    sheet2 = workbook.sheet_by_name(sheetName)
    rows = sheet2.nrows
    print("--------rows----------"+str(rows))
    preTitleIndex = 0
    tabInfos = []
    tableInfo = {}
    children = []
    for i in range(rows):
        row=sheet2.row_values(i)
        if row[1] != "" and row[3] == "":
            if i != preTitleIndex+1:
                preTitleIndex = i
                tableInfo["children"] = children
                if"tableName" in tableInfo:
                    tabInfos.append(tableInfo)
                tableInfo = {}
                children = []
            else:
                tableInfo["tableDesc"] = row[1]
                tableInfo["tableName"] = row[2]
        else:
            child = {}
            child["columName"] = row[1]
            child["columDesc"] = row[2]
            child["columType"] = row[3]
            child["columLength"] = (row[4])
            child["columDecimal"] = (row[5])
            child["nullStatus"] = row[6]
            child["defaultValue"] = row[7]
            child["Constraint"] = row[8]
            child["Comment"] = row[9]
            if row[1] != "" and row[2] != "" and row[3] != "" and row[4] != "" and row[5] != "":
                 if row[1] !="字段" and row[2]!="描述":
                    if row[1]!="id" and row[1]!="addTime" and row[1]!="deleteStatus":
                         children.append(child)
        if i == rows-1:
            tableInfo["children"] = children
            if "tableName" in tableInfo:
                tabInfos.append(tableInfo)

    for tableInfo in tabInfos:
            print(tableInfo)
    return tabInfos

#表名生成实体/DAO/等的前缀
def fromTableToPre(tableName):
    #result = str(tableName)[2:].capitalize()
    result = firstUpper(str(tableName)[2:])
    return result

def fromTableToPreSmall(tableName):
    result = str(tableName)[2:]
    return result

def dbType2Java(dbType):
    return typeMap[dbType]


def readConfig(basePath):
    result={}
    result["basePath"]=basePath
    resourcesPath = basePath + r"\config.txt"
    with open(resourcesPath, "r", encoding='utf-8') as resource:
        while True:
            resourceContentLine = resource.readline().strip()
            if resourceContentLine == None or resourceContentLine == "":
                break;

            # 取出每行的数据
            props= resourceContentLine.split("=")
            result[props[0]]=props[1]

    return result

def firstUpper(string):
    first = string[0]
    result = str(first).upper() + string[1:]

    return result
