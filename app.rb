require "sinatra"
require "erb"
require "pry"
require "./trivia_api"

enable :sessions

helpers do
  def render_template(filename)
    template = File.read(filename)
    ERB.new(template).result(binding)
  end
end

get "/" do
  @trivia_data = TriviaApi.new()
  session["current_question"] = @trivia_data.question
  session["question_options"] = @trivia_data.options
  session["show_options"] = false
  session["current_answer"] = @trivia_data.answer
  render_template("public/index.html.erb")
end

get "/answer" do
  @answer = session["current_answer"]
  render_template("public/index.html.erb")
end

get "/options" do
  session["show_options"] = true
  render_template("public/index.html.erb")
end
