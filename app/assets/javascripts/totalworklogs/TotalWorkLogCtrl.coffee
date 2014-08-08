
class TotalWorkLogCtrl

    constructor: (@$log, @TotalWorkLogService, @$scope) ->
        @$log.debug "constructing TotalWorkLogController"
        @worklogs = []
        @getAllWorkLogs()

    getAllWorkLogs: () ->
        @$log.debug "getAllWorkLogs()"

        @TotalWorkLogService.listWorkLogs()
        .then(
            (data) =>
                @$log.debug "Promise returned #{data.length} TotalWorkLogs"
                @worklogs = data
            ,
            (error) =>
                @$log.error "Unable to get WorkLogs: #{error}"
            )

    formatDate: (@date) ->
        tempDate = new Date(@date)
        return tempDate.getDate() + '/' + (tempDate.getMonth()+1) + '/' + tempDate.getFullYear()

controllersModule3.controller('TotalWorkLogCtrl', TotalWorkLogCtrl)