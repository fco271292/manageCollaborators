package com.fco271292

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AreaNegocioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AreaNegocio.list(params), model:[areaNegocioCount: AreaNegocio.count()]
    }

    def show(AreaNegocio areaNegocio) {
        respond areaNegocio
    }

    def create() {
        respond new AreaNegocio(params)
    }

    @Transactional
    def save(AreaNegocio areaNegocio) {
        if (areaNegocio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (areaNegocio.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond areaNegocio.errors, view:'create'
            return
        }

        areaNegocio.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'areaNegocio.label', default: 'AreaNegocio'), areaNegocio.id])
                redirect areaNegocio
            }
            '*' { respond areaNegocio, [status: CREATED] }
        }
    }

    def edit(AreaNegocio areaNegocio) {
        respond areaNegocio
    }

    @Transactional
    def update(AreaNegocio areaNegocio) {
        if (areaNegocio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (areaNegocio.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond areaNegocio.errors, view:'edit'
            return
        }

        areaNegocio.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'areaNegocio.label', default: 'AreaNegocio'), areaNegocio.id])
                redirect areaNegocio
            }
            '*'{ respond areaNegocio, [status: OK] }
        }
    }

    @Transactional
    def delete(AreaNegocio areaNegocio) {

        if (areaNegocio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        areaNegocio.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'areaNegocio.label', default: 'AreaNegocio'), areaNegocio.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'areaNegocio.label', default: 'AreaNegocio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
