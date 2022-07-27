<%--
  Created by IntelliJ IDEA.
  User: CDS-UTEZ
  Date: 04/07/2022
  Time: 08:51 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath();%>

<!-- Modal Asignar-->
<div class="modal fade" id="agregarHorario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" ng-click=">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Agregar horario</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Hora de incio: </label>
                        <input type="time" class="form-control" ng-model="horaInicio" required
                               oninvalid="this.setCustomValidity('Rango de horario permitido: 14:00 - 17:00')"
                               oninput="this.setCustomValidity('')"
                        >
                    </div>
                    <div class="form-group">
                        <label>Hora de finalización: </label>
                        <input type="time" class="form-control" ng-model="horaFin" required
                               oninvalid="this.setCustomValidity('Rango de horario permitido: 14:00 - 17:00')"
                               oninput="this.setCustomValidity('')"
                        >
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="">Cerrar</button>
                        <button type="submit" class="btn btn-primary" ng-click="agregar(agregarHora)">Agregar</button>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>

<!-- Modal Actualizar-->
<div class="modal fade" id="actualizarHorario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" ng-click=">
                    <span aria-hidden=" true
                ">&times;</span>
                </button>
                <h4 class="modal-title" id="">Actualizar horario</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Hora de incio: </label>
                        <input type="time" class="form-control" ng-model="update.horaInicio">
                    </div>
                    <div class="form-group">
                        <label>Hora de finalización: </label>
                        <input type="time" class="form-control" ng-model="update.horaFin">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="">Cerrar</button>
                <button type="button" class="btn btn-primary" ng-click="actualizarHorario()">Actualizar</button>
            </div>
        </div>
    </div>
</div>

