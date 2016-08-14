require 'rufus/scheduler'
def setup_schedule
  s = Rufus::Scheduler.new
  print "schedule started #{Time.new.strftime("%Y%m%dT%H%M%S.%L")}\n"
  s.every '4s' do
  	print "run at #{Time.new.strftime("%Y%m%dT%H%M%S.%L")}\n"
  end
  s.join
end

runner = Thread.new do
  setup_schedule
end
sleep 100
runner.kill
runner.join


# FAIL 6343
#.>>> test instance started at 20160813T161516.834
#sleeping at 20160813T161516.837
#setup_schedule at 20160813T161516.839
#scheduler.first_at at 2016-08-13 16:15:16 -0700
#scheduler.next_time at 2016-08-13 16:15:20 -0700
#run_once at 20160813T161517.063
#run_once at 20160813T161521.091
#run_once at 20160813T161525.346
#awake at 20160813T161526.840
#stop at 20160813T161526.840
#>>> test instance killed at 20160813T161526.865
#
# PASS 6343
#.>>> test instance started at 20160813T170455.518
#sleeping at 20160813T170455.520
#setup_schedule at 20160813T170455.521
#scheduler.first_at at 2016-08-13 17:04:55 -0700
#scheduler.next_time at 2016-08-13 17:04:59 -0700
#run_once at 20160813T170459.759
#run_once at 20160813T170504.009
#awake at 20160813T170505.520
#stop at 20160813T170505.520
#>>> test instance killed at 20160813T170505.528
