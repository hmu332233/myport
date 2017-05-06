class SearchController < ApplicationController
  def index
  end

  # GET /search/users/:word
  def search_users
    
    word = params[:word]

    
  end
  
  
  # GET /search/posts/:word
  # 목적 : 함수의 용도(목적)
  # 매개변수 : 함수의 인자로 사용되는 변수에 대한 설명
  # 반환 값 : 함수의 결과 값에 대한 설명
  # 변경 이력 : 함수를 변경한 변경자, 변경 일자, 변경 내용
  def search_posts
    
    word = params[:word]
    
    posts = Post.find_by_tag_name_at_all_posts(word)
    
    render json: posts.to_json
  end
end

