require "httparty"

class TriviaApi
  BASE_URI = "https://www.opentdb.com/api.php?amount=1"

  def data
    @data ||= HTTParty.get(BASE_URI)
  end

  def question
    data["results"][0]["question"]
  end

  def options
    data["results"][0]["incorrect_answers"] + [data["results"][0]["correct_answer"]]
  end

  def answer
    data["results"][0]["correct_answer"]
  end
end
