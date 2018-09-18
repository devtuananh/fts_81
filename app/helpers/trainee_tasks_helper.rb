module TraineeTasksHelper
  def check_status_task user_id, task_id
    @trainee_task = TraineeTask.find_trainee_task(user_id, task_id)
  end
end
