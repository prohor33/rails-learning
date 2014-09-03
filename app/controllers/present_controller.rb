class PresentController < ApplicationController
  def init
        # render plain: "how are you?"
    
    for i in 0..5
      puts "#{i}"
    end
    puts "run myrender"
    # myrender("test")
  end
  def myrender(render_text)
    render plain: render_text
  end
end
