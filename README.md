# ur5_moveit_pick-place

Проект для решения задачи pick&place на базе ur5 с использованием ros-noetic и moveit.

Для запуска необходимо собрать докер-образ, который прилагается в репозитории.

После чего необходимо запустить контейнер, инициализировать ROS и собрать проект. Также необходимо установить MoveIt конфиги для UR5 (https://github.com/ros-industrial/universal_robot.git). Сборка осуществляется из папки проекта следующийм образом:
  catkin build
Запуск кода:
  $ source devel/setup.bash
  $ roslaunch ur5_moveit_config demo.launch
  $ rosrun cobot_test pick_and_place_node
Работа pick&place начинается по инициализации "next" в RViz
