module Electretri
	module Common
		class << self

			def partial_matrix_hash(project)
				default = Hash.new
				project["alternatives"].each_key { |alternative| default[alternative] = {} }
				project["criteria"].each_key do |criterion|
					default.each_key do |alternative|
						default[alternative][criterion] = {'aSbh' => {},'bhSa' => {}}
						project["classes"].each_key do |klass|
							default[alternative][criterion]['aSbh'][klass] = nil
							default[alternative][criterion]['bhSa'][klass] = nil
						end
					end
				end
				default
			end

			def global_matrix_hash(project)
				default = Hash.new
				project["alternatives"].each_key { |alternative| default[alternative] = {'aSbh' => {},'bhSa' => {}} }
				default
			end

			def subordination_matrix_hash(project)
				default = Hash.new
				project["alternatives"].each_key { |alternative| default[alternative] = {'aSbh' => {} } }
				default
			end

			def classification_matrix_hash(project)
				default = Hash.new
				project["alternatives"].each_key { |alternative| default[alternative] = {'pessimistic' => nil, 'optimistic' => nil} }
				default
			end

		end
	end
end
