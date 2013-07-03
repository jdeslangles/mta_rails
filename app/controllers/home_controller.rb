class HomeController < ApplicationController

def home
  render 'menu'
end

def result
  start_train = params[:beginning].split(':')[0].to_sym
  stop_a = params[:beginning].split(':')[1]
  stop_train = params[:end].split(':')[0].to_sym
  stop_b = params[:end].split(':')[1]

n = ['ts', '34th', '28th-n', '23rd-n', 'us', '8th']
l = ['8th', '6th', 'us', '3rd', '1st']
s = ['gc', '33rd', '28th-s', '23rd-s', 'us', 'ap']
sv = ['ts', '42nd', '5th', 'gc', 'vj']

mta = {}

mta[:n] = n
mta[:l] = l
mta[:s] = s
mta[:sv] = sv


intersection = (mta[start_train] & mta[stop_train]).first

# case intersection

# when intersection !=nil

  if start_train != stop_train
    stop_a_index = mta[start_train].index(stop_a)
    stop_a_intersection_index = mta[start_train].index(intersection)
    trip_a_length = (stop_a_index - stop_a_intersection_index).abs

    stop_b_index = mta[stop_train].index(stop_b)
    stop_b_intersection_index = mta[stop_train].index(intersection)
    trip_b_length = (stop_b_index - stop_b_intersection_index).abs

    total_length_of_trip = trip_a_length + trip_b_length

  else
    stop_a_index = mta[start_train].index(stop_a)
    stop_b_index = mta[stop_train].index(stop_b)

    total_length_of_trip = (stop_a_index - stop_b_index).abs

  end

# when intersection = nil

#   total_length_of_trip = "Wow, too many changes. Stay home!"

# end


@total_length_of_trip = total_length_of_trip

  render 'menu'

end


end