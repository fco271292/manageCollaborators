package com.fco271292

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ColaboradorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Colaborador.list(params), model:[colaboradorCount: Colaborador.count()]
    }

    def show(Colaborador colaborador) {
        respond colaborador
    }

    def create() {
        respond new Colaborador(params)
    }

    @Transactional
    def save(Colaborador colaborador) {
        if (colaborador == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (colaborador.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond colaborador.errors, view:'create'
            return
        }

        colaborador.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'colaborador.label', default: 'Colaborador'), colaborador.id])
                redirect colaborador
            }
            '*' { respond colaborador, [status: CREATED] }
        }
    }

    def edit(Colaborador colaborador) {
        respond colaborador
    }

    @Transactional
    def update(Colaborador colaborador) {
        if (colaborador == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (colaborador.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond colaborador.errors, view:'edit'
            return
        }

        colaborador.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'colaborador.label', default: 'Colaborador'), colaborador.id])
                redirect colaborador
            }
            '*'{ respond colaborador, [status: OK] }
        }
    }

    @Transactional
    def delete(Colaborador colaborador) {

        if (colaborador == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        colaborador.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'colaborador.label', default: 'Colaborador'), colaborador.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'colaborador.label', default: 'Colaborador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
