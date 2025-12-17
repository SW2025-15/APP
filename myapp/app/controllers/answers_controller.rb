class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])

    @answer = @question.answers.new(answer_params)

    if @answer.save
      # 成功
      redirect_to @question, notice: '回答を投稿しました！'
    else
      # 失敗
      redirect_to @question, alert: '回答の投稿に失敗しました。'
    end
  end

  def destroy
    # 削除機能（今は誰でも削除できてしまう）
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to @question, notice: '回答を削除しました。'
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end