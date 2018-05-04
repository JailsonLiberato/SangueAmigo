//
//  PerguntaDB.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 03/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import Foundation

class SangueAmigoDB{
    var db : SQLiteHelper
    init(){
        self.db = SQLiteHelper(database: "sangueamigo.db")
    }
    
    func createTables(){
        let sql = "create table if not exists pergunta (_id integer primary key autoincrement, questao text, alternativaA text, alternativaB text, alternativaC text, alternativaD text, alternativaE text, resposta text);"
        _ = db.execSql(sql)
    }
    
    func getPergunta(_ codigo: Int) -> Pergunta{
        var pergunta : Pergunta?
        let stmt = db.query("SELECT * FROM pergunta where _id = ?", params:[codigo as AnyObject])
       let p = Pergunta()
        while(db.nextRow(stmt)){
            p.id = db.getInt(stmt, index: 0)
            p.questao = db.getString(stmt, index: 1)
            p.alternativaA = db.getString(stmt, index: 2)
            p.alternativaB = db.getString(stmt, index: 3)
            p.alternativaC = db.getString(stmt, index: 4)
            p.alternativaD = db.getString(stmt, index: 5)
            p.alternativaE = db.getString(stmt, index: 6)
            p.resposta = db.getString(stmt, index: 7)
            break
        }
        db.closeStatement(stmt)
        return p
    }
    
    func getPerguntas() -> Array<Pergunta>{
        var perguntas : Array<Pergunta> = []
        let stmt = db.query("SELECT * FROM pergunta")
        while(db.nextRow(stmt)){
            let p = Pergunta()
            p.id = db.getInt(stmt, index: 0)
            p.questao = db.getString(stmt, index: 1)
            p.alternativaA = db.getString(stmt, index: 2)
            p.alternativaB = db.getString(stmt, index: 3)
            p.alternativaC = db.getString(stmt, index: 4)
            p.alternativaD = db.getString(stmt, index: 5)
            p.alternativaE = db.getString(stmt, index: 6)
            p.resposta = db.getString(stmt, index: 7)
            perguntas.append(p)
        }
        db.closeStatement(stmt)
        return perguntas
    }
    
    func save(_ pergunta: Pergunta){
        if(pergunta.id == 0){
            let sql = "INSERT OR REPLACE INTO pergunta (questao,alternativaA,alternativaB,alternativaC,alternativaD,alternativaE,resposta) VALUES (?,?,?,?,?,?,?);"
            let params = [pergunta.questao, pergunta.alternativaA, pergunta.alternativaB, pergunta.alternativaC, pergunta.alternativaD, pergunta.alternativaE, pergunta.resposta]
            let id = db.execSql(sql, params:params as Array<AnyObject>)
            print("Pergunta \(pergunta.questao) - Id: \(id) inserido com sucesso.")
        }else{
            let sql = "UPDATE pergunta SET questao=?, alternativaA=?, alternativaB=?, alternativaC=?, alternativaD=?, alternativaE=?, resposta=? WHERE _id=? VALUES (?,?,?,?,?,?,?,?);"
            let params = [pergunta.questao, pergunta.alternativaA, pergunta.alternativaB, pergunta.alternativaC, pergunta.alternativaD, pergunta.alternativaE, pergunta.resposta] as [Any]
            let id = db.execSql(sql, params:params as Array<AnyObject>)
            print("Pergunta \(pergunta.questao), id: \(id) atualizado com sucesso.")
            
        }
    }
    
    func close(){
        self.db.close()
    }
}
