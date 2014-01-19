namespace :post do
  task :regenerate => :environment do
    Post.all.each do |p|
      p.save
    end
  end
end
