<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Time_Table.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Time Table</title>
    <link rel="shortcut icon" href="img/fav.ico" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="btnDiv">
        <a href="../index.aspx" class="btn btn-outline btn-primary">Admin Panel</a>
    </div>
    <form id="form1" runat="server">
        <div class="cd-schedule loading">
            <div class="timeline">
                <ul>
                    <li><span>08:00</span></li>
                    <li><span>08:30</span></li>
                    <li><span>09:00</span></li>
                    <li><span>09:30</span></li>
                    <li><span>10:00</span></li>
                    <li><span>10:30</span></li>
                    <li><span>11:00</span></li>
                    <li><span>11:30</span></li>
                    <li><span>12:00</span></li>
                    <li><span>12:30</span></li>
                    <li><span>13:00</span></li>
                    <li><span>13:30</span></li>
                    <li><span>14:00</span></li>
                    <li><span>14:30</span></li>
                    <li><span>15:00</span></li>
                    <li><span>15:30</span></li>
                    <li><span>16:00</span></li>
                    <li><span>16:30</span></li>
                    <li><span>17:00</span></li>
                    <li><span>17:30</span></li>
                    <li><span>18:00</span></li>
                    <li><span>18:30</span></li>
                    <li><span>19:00</span></li>
                    <li><span>19:30</span></li>
                    <li><span>20:00</span></li>
                    <li><span>20:30</span></li>
                    <li><span>21:00</span></li>
                </ul>
            </div>
            <div class="events">
                <ul>
                    <li class="events-group <%--month--%>">
                        <div class="top-info"><span>Monday</span></div>

                        <ul>
                            <li class="single-event" data-start="08:00" data-end="10:30" data-content="event-abs-circuit" data-event="event-1">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name ">Abs Circuit</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="11:00" data-end="12:30" data-content="event-rowing-workout" data-event="event-2">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Rowing Workout</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="14:00" data-end="15:15" data-content="event-yoga-1" data-event="event-3">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Yoga Level 1</em>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="events-group <%--month--%>">
                        <div class="top-info"><span>Tuesday</span></div>

                        <ul>
                            <li class="single-event" data-start="10:00" data-end="11:00" data-content="event-rowing-workout" data-event="event-2">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Rowing Workout</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="11:30" data-end="13:00" data-content="event-restorative-yoga" data-event="event-4">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Restorative Yoga</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="13:30" data-end="15:00" data-content="event-abs-circuit" data-event="event-1">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Abs Circuit</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="15:45" data-end="16:45" data-content="event-yoga-1" data-event="event-3">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Yoga Level 1</em>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="events-group <%--month--%>">
                        <div class="top-info"><span>Wednesday</span></div>

                        <ul>
                            <li class="single-event" data-start="09:00" data-end="10:15" data-content="event-restorative-yoga" data-event="event-4">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Restorative Yoga</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="10:45" data-end="11:45" data-content="event-yoga-1" data-event="event-3">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Yoga Level 1</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="12:00" data-end="13:45" data-content="event-rowing-workout" data-event="event-2">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Rowing Workout</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="13:45" data-end="15:00" data-content="event-yoga-1" data-event="event-3">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Yoga Level 1</em>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="events-group <%--month--%>">
                        <div class="top-info"><span>Thursday</span></div>

                        <ul>
                            <li class="single-event" data-start="09:30" data-end="10:30" data-content="event-abs-circuit" data-event="event-1">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Abs Circuit</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="12:00" data-end="13:45" data-content="event-restorative-yoga" data-event="event-4">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Restorative Yoga</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="15:30" data-end="16:30" data-content="event-abs-circuit" data-event="event-1">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Abs Circuit</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="19:00" data-end="20:50" data-content="event-rowing-workout" data-event="event-2">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Rowing Workout</em>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="events-group <%--month--%>">
                        <div class="top-info"><span>Friday</span></div>

                        <ul>
                            <li class="single-event" data-start="10:00" data-end="11:00" data-content="event-rowing-workout" data-event="event-2">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Rowing Workout</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="12:30" data-end="14:00" data-content="event-abs-circuit" data-event="event-1">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Abs Circuit</em>
                                </a>
                            </li>

                            <li class="single-event" data-start="15:45" data-end="16:45" data-content="event-yoga-1" data-event="event-3">
                                <a href="#0">
                                    <div class="event-info" style="display: none;">Restorative Yoga. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, unde, nulla. Vel unde deleniti, distinctio inventore quis molestiae perferendis, eum quo harum dolorum reiciendis sunt dicta maiores similique! Officiis repellat iure odio debitis enim eius commodi quae deserunt quam assumenda, ab asperiores reiciendis minima maxime odit laborum, libero veniam non?</div>
                                    <em class="event-name">Yoga Level 1</em>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <%-- month --%>
                    
                    <%-- Month --%>

                </ul>
            </div>
            <div class="event-modal">
                <header class="header">
                    <div class="content">
                        <span class="event-date"></span>
                        <h3 class="event-name"></h3>
                    </div>

                    <div class="header-bg"></div>
                </header>

                <div class="body">
                    <div class="event-info">
                        <div></div>
                    </div>
                    <div class="body-bg"></div>
                </div>

                <a href="#0" class="close">Close</a>
            </div>

            <div class="cover-layer"></div>
        </div>
        <!-- .cd-schedule -->

    </form>
    <script src="js/modernizr.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script>
        if (!window.jQuery) document.write('<script src="js/jquery-3.0.0.min.js"><\/script>');
    </script>
    <script src="js/main.js"></script>
</body>
</html>
