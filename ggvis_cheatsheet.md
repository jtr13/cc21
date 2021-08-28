# GGvis cheatsheet

Chenhui Mao



[Link to the cheatsheet](resources/ggvis_cheatsheet/ggvis_cheatsheet.pdf)

## ggvis

Official website: <http://ggvis.rstudio.com/>

ggvis is a visualization package that can:
- plot the graph in the same way as ggplot2
- create interaction strategies where you can interact with the graph locally or in the website

### Getting start

First thing first, we shall import some necessary packages


```r
#install.packages("dplyr")
#install.packages("ggvis")

library(ggvis)
library(dplyr)
```


This is a simple demonstration on how to use `ggvis`. As can be seen, ggvis can create graph in the same way ggplot does!


```r
p <- ggvis(mtcars, x = ~wt, y = ~ mpg)
layer_points(p)
```

```{=html}
<div id="plot_id889101588-container" class="ggvis-output-container">
<div id="plot_id889101588" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id889101588_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id889101588" data-renderer="svg">SVG</a>
 | 
<a id="plot_id889101588_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id889101588" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id889101588_download" class="ggvis-download" data-plot-id="plot_id889101588">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id889101588_spec = {
  "data": [
    {
      "name": "mtcars0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": "mtcars0"
          }
        }
      },
      "from": {
        "data": "mtcars0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id889101588").parseSpec(plot_id889101588_spec);
</script>
```
Similar way to write basic ggvis


```r
layer_points(ggvis(mtcars, x = ~wt, y = ~ mpg))
```

```{=html}
<div id="plot_id744112182-container" class="ggvis-output-container">
<div id="plot_id744112182" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id744112182_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id744112182" data-renderer="svg">SVG</a>
 | 
<a id="plot_id744112182_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id744112182" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id744112182_download" class="ggvis-download" data-plot-id="plot_id744112182">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id744112182_spec = {
  "data": [
    {
      "name": "mtcars0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": "mtcars0"
          }
        }
      },
      "from": {
        "data": "mtcars0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id744112182").parseSpec(plot_id744112182_spec);
</script>
```

Apply pipeline to write ggvis

```r
mtcars %>%
  ggvis(x = ~wt, y = ~mpg) %>%
  layer_points
```

```{=html}
<div id="plot_id280389848-container" class="ggvis-output-container">
<div id="plot_id280389848" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id280389848_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id280389848" data-renderer="svg">SVG</a>
 | 
<a id="plot_id280389848_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id280389848" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id280389848_download" class="ggvis-download" data-plot-id="plot_id280389848">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id280389848_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id280389848").parseSpec(plot_id280389848_spec);
</script>
```

We can add a theme on it


```r
mtcars %>% 
ggvis(x = ~wt, y = ~mpg) %>% 
layer_points() %>%
  add_axis("x", title = "Weight", ticks = 40,
    properties = axis_props(
      ticks = list(stroke = "red"),
      majorTicks = list(strokeWidth = 2),
      grid = list(stroke = "red"),
      labels = list(
        fill = "steelblue",
        angle = 50,
        fontSize = 14,
        align = "left",
        baseline = "middle",
        dx = 3
      ),
      title = list(fontSize = 16),
      axis = list(stroke = "#333", strokeWidth = 1.5)
    )
  )
```

```{=html}
<div id="plot_id877447739-container" class="ggvis-output-container">
<div id="plot_id877447739" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id877447739_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id877447739" data-renderer="svg">SVG</a>
 | 
<a id="plot_id877447739_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id877447739" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id877447739_download" class="ggvis-download" data-plot-id="plot_id877447739">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id877447739_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "title": "Weight",
      "ticks": 40,
      "layer": "back",
      "grid": true,
      "properties": {
        "ticks": {
          "stroke": {
            "value": "red"
          }
        },
        "majorTicks": {
          "strokeWidth": {
            "value": 2
          }
        },
        "grid": {
          "stroke": {
            "value": "red"
          }
        },
        "labels": {
          "fill": {
            "value": "steelblue"
          },
          "angle": {
            "value": 50
          },
          "fontSize": {
            "value": 14
          },
          "align": {
            "value": "left"
          },
          "baseline": {
            "value": "middle"
          },
          "dx": {
            "value": 3
          }
        },
        "title": {
          "fontSize": {
            "value": 16
          }
        },
        "axis": {
          "stroke": {
            "value": "#333"
          },
          "strokeWidth": {
            "value": 1.5
          }
        }
      }
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id877447739").parseSpec(plot_id877447739_spec);
</script>
```

## aesthetics
Try to adjust the parameters


```r
mtcars %>%
  ggvis(~mpg, ~disp, stroke = ~vs) %>%
  layer_points()
```

```{=html}
<div id="plot_id916894751-container" class="ggvis-output-container">
<div id="plot_id916894751" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id916894751_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id916894751" data-renderer="svg">SVG</a>
 | 
<a id="plot_id916894751_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id916894751" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id916894751_download" class="ggvis-download" data-plot-id="plot_id916894751">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id916894751_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "vs": "number",
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"vs\",\"mpg\",\"disp\"\n0,21,160\n0,21,160\n1,22.8,108\n1,21.4,258\n0,18.7,360\n1,18.1,225\n0,14.3,360\n1,24.4,146.7\n1,22.8,140.8\n1,19.2,167.6\n1,17.8,167.6\n0,16.4,275.8\n0,17.3,275.8\n0,15.2,275.8\n0,10.4,472\n0,10.4,460\n0,14.7,440\n1,32.4,78.7\n1,30.4,75.7\n1,33.9,71.1\n1,21.5,120.1\n0,15.5,318\n0,15.2,304\n0,13.3,350\n0,19.2,400\n1,27.3,79\n0,26,120.3\n1,30.4,95.1\n0,15.8,351\n0,19.7,145\n0,15,301\n1,21.4,121"
    },
    {
      "name": "scale/stroke",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n51.055\n492.045"
    }
  ],
  "scales": [
    {
      "name": "stroke",
      "domain": {
        "data": "scale/stroke",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": ["#132B43", "#56B1F7"]
    },
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "stroke": {
            "scale": "stroke",
            "field": "data.vs"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "stroke": "stroke",
      "title": "vs"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "disp"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id916894751").parseSpec(plot_id916894751_spec);
</script>
```


```r
mtcars %>% 
  ggvis(~mpg, ~disp, fill = ~vs) %>% 
  layer_points()
```

```{=html}
<div id="plot_id374567908-container" class="ggvis-output-container">
<div id="plot_id374567908" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id374567908_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id374567908" data-renderer="svg">SVG</a>
 | 
<a id="plot_id374567908_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id374567908" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id374567908_download" class="ggvis-download" data-plot-id="plot_id374567908">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id374567908_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "vs": "number",
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"vs\",\"mpg\",\"disp\"\n0,21,160\n0,21,160\n1,22.8,108\n1,21.4,258\n0,18.7,360\n1,18.1,225\n0,14.3,360\n1,24.4,146.7\n1,22.8,140.8\n1,19.2,167.6\n1,17.8,167.6\n0,16.4,275.8\n0,17.3,275.8\n0,15.2,275.8\n0,10.4,472\n0,10.4,460\n0,14.7,440\n1,32.4,78.7\n1,30.4,75.7\n1,33.9,71.1\n1,21.5,120.1\n0,15.5,318\n0,15.2,304\n0,13.3,350\n0,19.2,400\n1,27.3,79\n0,26,120.3\n1,30.4,95.1\n0,15.8,351\n0,19.7,145\n0,15,301\n1,21.4,121"
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n51.055\n492.045"
    }
  ],
  "scales": [
    {
      "name": "fill",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": ["#132B43", "#56B1F7"]
    },
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "value": 50
          },
          "fill": {
            "scale": "fill",
            "field": "data.vs"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
      "title": "vs"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "disp"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id374567908").parseSpec(plot_id374567908_spec);
</script>
```


```r
mtcars %>% 
  ggvis(~mpg, ~disp, size = ~vs) %>% 
  layer_points()
```

```{=html}
<div id="plot_id334975377-container" class="ggvis-output-container">
<div id="plot_id334975377" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id334975377_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id334975377" data-renderer="svg">SVG</a>
 | 
<a id="plot_id334975377_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id334975377" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id334975377_download" class="ggvis-download" data-plot-id="plot_id334975377">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id334975377_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "vs": "number",
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"vs\",\"mpg\",\"disp\"\n0,21,160\n0,21,160\n1,22.8,108\n1,21.4,258\n0,18.7,360\n1,18.1,225\n0,14.3,360\n1,24.4,146.7\n1,22.8,140.8\n1,19.2,167.6\n1,17.8,167.6\n0,16.4,275.8\n0,17.3,275.8\n0,15.2,275.8\n0,10.4,472\n0,10.4,460\n0,14.7,440\n1,32.4,78.7\n1,30.4,75.7\n1,33.9,71.1\n1,21.5,120.1\n0,15.5,318\n0,15.2,304\n0,13.3,350\n0,19.2,400\n1,27.3,79\n0,26,120.3\n1,30.4,95.1\n0,15.8,351\n0,19.7,145\n0,15,301\n1,21.4,121"
    },
    {
      "name": "scale/size",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n51.055\n492.045"
    }
  ],
  "scales": [
    {
      "name": "size",
      "domain": {
        "data": "scale/size",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": [20, 100]
    },
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "scale": "size",
            "field": "data.vs"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "size": "size",
      "title": "vs"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "disp"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id334975377").parseSpec(plot_id334975377_spec);
</script>
```


```r
mtcars %>% 
  ggvis(~mpg, ~disp, shape = ~factor(cyl)) %>% 
  layer_points()
```

```{=html}
<div id="plot_id425488089-container" class="ggvis-output-container">
<div id="plot_id425488089" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id425488089_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id425488089" data-renderer="svg">SVG</a>
 | 
<a id="plot_id425488089_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id425488089" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id425488089_download" class="ggvis-download" data-plot-id="plot_id425488089">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id425488089_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "mpg": "number",
          "disp": "number"
        }
      },
      "values": "\"factor(cyl)\",\"mpg\",\"disp\"\n\"6\",21,160\n\"6\",21,160\n\"4\",22.8,108\n\"6\",21.4,258\n\"8\",18.7,360\n\"6\",18.1,225\n\"8\",14.3,360\n\"4\",24.4,146.7\n\"4\",22.8,140.8\n\"6\",19.2,167.6\n\"6\",17.8,167.6\n\"8\",16.4,275.8\n\"8\",17.3,275.8\n\"8\",15.2,275.8\n\"8\",10.4,472\n\"8\",10.4,460\n\"8\",14.7,440\n\"4\",32.4,78.7\n\"4\",30.4,75.7\n\"4\",33.9,71.1\n\"4\",21.5,120.1\n\"8\",15.5,318\n\"8\",15.2,304\n\"8\",13.3,350\n\"8\",19.2,400\n\"4\",27.3,79\n\"4\",26,120.3\n\"4\",30.4,95.1\n\"8\",15.8,351\n\"6\",19.7,145\n\"8\",15,301\n\"4\",21.4,121"
    },
    {
      "name": "scale/shape",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"4\"\n\"6\"\n\"8\""
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n51.055\n492.045"
    }
  ],
  "scales": [
    {
      "name": "shape",
      "type": "ordinal",
      "domain": {
        "data": "scale/shape",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": "shapes"
    },
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "shape": {
            "scale": "shape",
            "field": "data.factor(cyl)"
          },
          "x": {
            "scale": "x",
            "field": "data.mpg"
          },
          "y": {
            "scale": "y",
            "field": "data.disp"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "shape": "shape",
      "title": "factor(cyl)"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "disp"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id425488089").parseSpec(plot_id425488089_spec);
</script>
```


```r
mtcars %>% 
  ggvis(~wt, ~mpg, fill := "red",  stroke := "black") %>% 
  layer_points()
```

```{=html}
<div id="plot_id855156526-container" class="ggvis-output-container">
<div id="plot_id855156526" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id855156526_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id855156526" data-renderer="svg">SVG</a>
 | 
<a id="plot_id855156526_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id855156526" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id855156526_download" class="ggvis-download" data-plot-id="plot_id855156526">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id855156526_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "value": 50
          },
          "fill": {
            "value": "red"
          },
          "stroke": {
            "value": "black"
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id855156526").parseSpec(plot_id855156526_spec);
</script>
```


```r
mtcars %>% 
  ggvis(~wt, ~mpg, size := 300, opacity := 0.4) %>% 
  layer_points()
```

```{=html}
<div id="plot_id606861722-container" class="ggvis-output-container">
<div id="plot_id606861722" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id606861722_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id606861722" data-renderer="svg">SVG</a>
 | 
<a id="plot_id606861722_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id606861722" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id606861722_download" class="ggvis-download" data-plot-id="plot_id606861722">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id606861722_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 300
          },
          "opacity": {
            "value": 0.4
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id606861722").parseSpec(plot_id606861722_spec);
</script>
```

## Interaction

### basic interaction

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points() %>%
  layer_smooths(
    span = input_slider(0.2, 1, value = 0.5, step = 0.05, label = "span")
  )
```

```{=html}
<div id="plot_id163742684-container" class="ggvis-output-container">
<div id="plot_id163742684" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id163742684_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id163742684" data-renderer="svg">SVG</a>
 | 
<a id="plot_id163742684_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id163742684" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id163742684_download" class="ggvis-download" data-plot-id="plot_id163742684">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id163742684_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,31.1578692505819\n1.56250632911392,31.0986698802032\n1.61201265822785,30.9960250236674\n1.66151898734177,30.8383424549115\n1.7110253164557,30.6393840227985\n1.76053164556962,30.402462560398\n1.81003797468354,30.1308363791107\n1.85954430379747,29.8277637903378\n1.90905063291139,29.4965031054802\n1.95855696202532,29.1340918645825\n2.00806329113924,28.708615118389\n2.05756962025316,28.2315702353424\n2.10707594936709,27.7227606790902\n2.15658227848101,27.2019899132795\n2.20608860759494,26.6870287695318\n2.25559493670886,26.0498911543942\n2.30510126582278,25.2716542771294\n2.35460759493671,24.4462603917728\n2.40411392405063,23.6676517523597\n2.45362025316456,23.0297706129253\n2.50312658227848,22.5366687667688\n2.55263291139241,22.043105457921\n2.60213924050633,21.570549028688\n2.65164556962025,21.1479030539244\n2.70115189873418,20.8040711084846\n2.7506582278481,20.5679567672234\n2.80016455696203,20.5569873525453\n2.84967088607595,20.8445160338316\n2.89917721518987,20.9150757299609\n2.9486835443038,21.0236783093429\n2.99818987341772,21.1931078212329\n3.04769620253165,21.3480628664792\n3.09720253164557,21.4132420459303\n3.14670886075949,21.3133439604345\n3.19621518987342,21.0111564991249\n3.24572151898734,20.5411184425284\n3.29522784810127,19.8057099685569\n3.34473417721519,18.9323662081205\n3.39424050632911,18.0620855801734\n3.44374683544304,17.3226686118672\n3.49325316455696,16.5274083695918\n3.54275949367089,15.8723922871438\n3.59226582278481,15.4663920667705\n3.64177215189873,15.3537231538096\n3.69127848101266,15.4388816990418\n3.74078481012658,15.5860801145833\n3.79029113924051,15.6670179988257\n3.83979746835443,15.7678124698591\n3.88930379746835,15.8617856545769\n3.93881012658228,15.9278944039487\n3.9883164556962,15.9675915666615\n4.03782278481013,15.9822130539336\n4.08732911392405,15.9730947769829\n4.13683544303798,15.9415726470276\n4.1863417721519,15.8889825752859\n4.23584810126582,15.8166604729758\n4.28535443037975,15.7259422513154\n4.33486075949367,15.6181638215229\n4.3843670886076,15.4946610948164\n4.43387341772152,15.356769982414\n4.48337974683544,15.2058263955337\n4.53288607594937,15.0431662453937\n4.58239240506329,14.8701254432122\n4.63189873417722,14.6880399002072\n4.68140506329114,14.4982455275968\n4.73091139240506,14.3020782365992\n4.78041772151899,14.1008739384324\n4.82992405063291,13.8959685443146\n4.87943037974684,13.6886979654639\n4.92893670886076,13.4803981130983\n4.97844303797468,13.2724048984361\n5.02794936708861,13.0660542326953\n5.07745569620253,12.862682027094\n5.12696202531646,12.6636241928504\n5.17646835443038,12.4702166411825\n5.2259746835443,12.2837952833085\n5.27548101265823,12.1047883164442\n5.32498734177215,11.9291725392028\n5.37449367088608,11.7569216240903\n5.424,11.5887935207892"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id163742684").parseSpec(plot_id163742684_spec);
</script>
```
Next, we add some interaction strategies into it. We can add the following interaction into the graph:
- Change the size of the dot
- Change the opacity of the dot


```r
mtcars %>% 
   ggvis(~wt, ~mpg, 
         size := input_slider(10, 100),
         opacity := input_slider(0, 1)
   ) %>% 
   layer_points()
```

```{=html}
<div id="plot_id847073814-container" class="ggvis-output-container">
<div id="plot_id847073814" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id847073814_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id847073814" data-renderer="svg">SVG</a>
 | 
<a id="plot_id847073814_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id847073814" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id847073814_download" class="ggvis-download" data-plot-id="plot_id847073814">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id847073814_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "reactive_223548973": "number",
          "reactive_640649880": "number",
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"reactive_223548973\",\"reactive_640649880\",\"wt\",\"mpg\"\n55,0.5,2.62,21\n55,0.5,2.875,21\n55,0.5,2.32,22.8\n55,0.5,3.215,21.4\n55,0.5,3.44,18.7\n55,0.5,3.46,18.1\n55,0.5,3.57,14.3\n55,0.5,3.19,24.4\n55,0.5,3.15,22.8\n55,0.5,3.44,19.2\n55,0.5,3.44,17.8\n55,0.5,4.07,16.4\n55,0.5,3.73,17.3\n55,0.5,3.78,15.2\n55,0.5,5.25,10.4\n55,0.5,5.424,10.4\n55,0.5,5.345,14.7\n55,0.5,2.2,32.4\n55,0.5,1.615,30.4\n55,0.5,1.835,33.9\n55,0.5,2.465,21.5\n55,0.5,3.52,15.5\n55,0.5,3.435,15.2\n55,0.5,3.84,13.3\n55,0.5,3.845,19.2\n55,0.5,1.935,27.3\n55,0.5,2.14,26\n55,0.5,1.513,30.4\n55,0.5,3.17,15.8\n55,0.5,2.77,19.7\n55,0.5,3.57,15\n55,0.5,2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "field": "data.reactive_223548973"
          },
          "opacity": {
            "field": "data.reactive_640649880"
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id847073814").parseSpec(plot_id847073814_spec);
</script>
```

Add interaction strategies to a histograms
- Change the width of the histograms
- Change the center of the histograms


```r
mtcars %>% 
   ggvis(~wt) %>% 
   layer_histograms(
                    width =  input_slider(0, 2, step = 0.10, label = "width"),
                    center = input_slider(0, 2, step = 0.05, label = "center"))
```

```{=html}
<div id="plot_id901215022-container" class="ggvis-output-container">
<div id="plot_id901215022" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id901215022_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id901215022" data-renderer="svg">SVG</a>
 | 
<a id="plot_id901215022_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id901215022" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id901215022_download" class="ggvis-download" data-plot-id="plot_id901215022">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id901215022_spec = {
  "data": [
    {
      "name": ".0/bin1/stack2",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "stack_upr_": "number",
          "stack_lwr_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n1.5,2.5,8,0\n2.5,3.5,13,0\n3.5,4.5,8,0\n4.5,5.5,3,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.3\n5.7"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n13.65"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "value": "#333333"
          },
          "x": {
            "scale": "x",
            "field": "data.xmin_"
          },
          "x2": {
            "scale": "x",
            "field": "data.xmax_"
          },
          "y": {
            "scale": "y",
            "field": "data.stack_upr_"
          },
          "y2": {
            "scale": "y",
            "field": "data.stack_lwr_"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/bin1/stack2"
          }
        }
      },
      "from": {
        "data": ".0/bin1/stack2"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "count"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id901215022").parseSpec(plot_id901215022_spec);
</script>
```



Add tooltip


```r
mtcars %>%
   ggvis(~wt, ~mpg) %>% 
   layer_points()%>%
   add_tooltip(function(df) df$wt)
```

```{=html}
<div id="plot_id835582225-container" class="ggvis-output-container">
<div id="plot_id835582225" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id835582225_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id835582225" data-renderer="svg">SVG</a>
 | 
<a id="plot_id835582225_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id835582225" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id835582225_download" class="ggvis-download" data-plot-id="plot_id835582225">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id835582225_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id835582225").parseSpec(plot_id835582225_spec);
</script>
```

### Input option

#### input_select()


```r
mtcars %>% ggvis(x = ~wt) %>%
  layer_densities(
    adjust = input_slider(.1, 2, value = 1, step = .1, label = "Bandwidth adjustment"),
    kernel = input_select(
      c("Gaussian" = "gaussian", "Epanechnikov" = "epanechnikov",
        "Rectangular" = "rectangular", "Triangular" = "triangular",
        "Biweight" = "biweight", "Cosine" = "cosine", "Optcosine" = "optcosine"),
      label = "Kernel")
  )
```

```{=html}
<div id="plot_id583819538-container" class="ggvis-output-container">
<div id="plot_id583819538" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id583819538_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id583819538" data-renderer="svg">SVG</a>
 | 
<a id="plot_id583819538_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id583819538" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id583819538_download" class="ggvis-download" data-plot-id="plot_id583819538">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id583819538_spec = {
  "data": [
    {
      "name": ".0/density1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n0.47657276119403,0.000588305747859961\n0.500038857184665,0.000724273083006101\n0.5235049531753,0.000890187050444256\n0.546971049165935,0.00108639939899363\n0.57043714515657,0.00132202357771975\n0.593903241147205,0.00160228383342272\n0.61736933713784,0.00192930604137108\n0.640835433128475,0.0023199484048341\n0.66430152911911,0.00277373177947855\n0.687767625109745,0.00329897159395508\n0.71123372110038,0.00391592050709678\n0.734699817091015,0.00462020854905097\n0.75816591308165,0.00543105642564582\n0.781632009072285,0.00636122905954197\n0.80509810506292,0.00740902990206435\n0.828564201053556,0.00860665962140432\n0.852030297044191,0.00995092627877982\n0.875496393034826,0.0114478928900423\n0.898962489025461,0.0131380338308608\n0.922428585016096,0.0150003605143442\n0.945894681006731,0.0170589587074326\n0.969360776997366,0.0193336408734796\n0.992826872988001,0.0218073027330216\n1.01629296897864,0.0245167988061496\n1.03975906496927,0.0274522481725405\n1.06322516095991,0.030603195001548\n1.08669125695054,0.0340176945552008\n1.11015735294118,0.0376512150966534\n1.13362344893181,0.0415147783711084\n1.15708954492245,0.0456236581361032\n1.18055564091308,0.0499397569574342\n1.20402173690372,0.0544801938390768\n1.22748783289435,0.0592261890143605\n1.25095392888499,0.0641496857588712\n1.27442002487562,0.0692672807927108\n1.29788612086626,0.0745350664949882\n1.32135221685689,0.0799387963862219\n1.34481831284753,0.0854730845112284\n1.36828440883816,0.0910989118296549\n1.3917505048288,0.0968039845543404\n1.41521660081943,0.10256505697024\n1.43868269681007,0.108356278936408\n1.4621487928007,0.114158052603272\n1.48561488879134,0.119947620380374\n1.50908098478197,0.125706241141974\n1.53254708077261,0.131406117950836\n1.55601317676324,0.13703877379697\n1.57947927275388,0.142581704367193\n1.60294536874451,0.148015308507181\n1.62641146473515,0.153339098776507\n1.64987756072578,0.158523637620211\n1.67334365671642,0.163569769293107\n1.69680975270705,0.168477769214092\n1.72027584869769,0.173211707121597\n1.74374194468832,0.177797160097589\n1.76720804067896,0.182221148588676\n1.79067413666959,0.186470128321248\n1.81414023266023,0.190565894223406\n1.83760632865086,0.194489046743278\n1.8610724246415,0.198249312190565\n1.88453852063213,0.201861258388592\n1.90800461662277,0.205299759984403\n1.9314707126134,0.208595101735944\n1.95493680860404,0.21174720371779\n1.97840290459467,0.214746128558949\n2.00186900058531,0.217619055710213\n2.02533509657594,0.220358250314979\n2.04880119256658,0.222972351354043\n2.07226728855721,0.22547937185284\n2.09573338454785,0.227869145533736\n2.11919948053848,0.230164118536311\n2.14266557652912,0.232373069642056\n2.16613167251975,0.234493957333701\n2.18959776851039,0.236550276116201\n2.21306386450102,0.238546825000922\n2.23652996049166,0.2404944940664\n2.25999605648229,0.242409856403358\n2.28346215247293,0.244302118591343\n2.30692824846356,0.246187154052006\n2.3303943444542,0.248078195078307\n2.35386044044483,0.249994054456612\n2.37732653643547,0.251945864480615\n2.4007926324261,0.253952088341491\n2.42425872841674,0.256034439307748\n2.44772482440737,0.258200157685418\n2.47119092039801,0.260480234840795\n2.49465701638864,0.262887276040962\n2.51812311237928,0.265429623289554\n2.54158920836992,0.268157623850324\n2.56505530436055,0.271060870502926\n2.58852140035119,0.274165981418292\n2.61198749634182,0.277514909239932\n2.63545359233246,0.281093306433413\n2.65891968832309,0.284948842850159\n2.68238578431373,0.28909478862154\n2.70585188030436,0.293522692859792\n2.729317976295,0.298303373644743\n2.75278407228563,0.303405492454256\n2.77625016827627,0.308842781005075\n2.7997162642669,0.314672468825679\n2.82318236025754,0.320841951350047\n2.84664845624817,0.327388009296796\n2.87011455223881,0.334313528401153\n2.89358064822944,0.341574309208405\n2.91704674422008,0.34921230263341\n2.94051284021071,0.357172196848272\n2.96397893620135,0.365422564268619\n2.98744503219198,0.373979658968043\n3.01091112818262,0.382757040499513\n3.03437722417325,0.391729418297882\n3.05784332016389,0.400851445916785\n3.08130941615452,0.410052258391934\n3.10477551214516,0.41927464669286\n3.12824160813579,0.428446903986893\n3.15170770412643,0.437506444591615\n3.17517380011706,0.446337359525645\n3.1986398961077,0.45489908932678\n3.22210599209833,0.463097299356939\n3.24557208808897,0.470808274881651\n3.2690381840796,0.47801645916918\n3.29250428007024,0.484571980663196\n3.31597037606087,0.490414712483011\n3.33943647205151,0.495532896974292\n3.36290256804214,0.499707356577843\n3.38636866403278,0.503007430520713\n3.40983476002341,0.50536374270938\n3.43330085601405,0.506604746402882\n3.45676695200468,0.506855170831414\n3.48023304799532,0.505979448983149\n3.50369914398595,0.503956733075168\n3.52716523997659,0.50088835859495\n3.55063133596722,0.49659690704771\n3.57409743195786,0.49122849476299\n3.59756352794849,0.484822634537357\n3.62102962393913,0.477245134425987\n3.64449571992976,0.468722266350565\n3.6679618159204,0.459220073914058\n3.69142791191103,0.448764231534265\n3.71489400790167,0.437520186859911\n3.7383601038923,0.425444151111721\n3.76182619988294,0.412676555651337\n3.78529229587357,0.399324822957639\n3.80875839186421,0.385364423059024\n3.83222448785484,0.370981801407406\n3.85569058384548,0.356228145313849\n3.87915667983611,0.341168107887202\n3.90262277582675,0.325918851310435\n3.92608887181738,0.31054146377493\n3.94955496780802,0.295122987954801\n3.97302106379865,0.279735015276659\n3.99648715978929,0.264467545839267\n4.01995325577992,0.249369736702943\n4.04341935177056,0.234506533148838\n4.06688544776119,0.219969822244311\n4.09035154375183,0.205765187230396\n4.11381763974246,0.191980232004599\n4.1372837357331,0.178655774985774\n4.16074983172373,0.165785320026581\n4.18421592771437,0.153487025119876\n4.207682023705,0.141720132216641\n4.23114811969564,0.130502843513284\n4.25461421568627,0.119939299117928\n4.27808031167691,0.109941933547032\n4.30154640766754,0.100573865508889\n4.32501250365818,0.0918569491044449\n4.34847859964882,0.0837247867257952\n4.37194469563945,0.0762698518184738\n4.39541079163009,0.0694291663623666\n4.41887688762072,0.0631720210349336\n4.44234298361136,0.0576020887132944\n4.46580907960199,0.0525948484625015\n4.48927517559263,0.0481822537167722\n4.51274127158326,0.0443877465111966\n4.5362073675739,0.0411245045719512\n4.55967346356453,0.0384521532829531\n4.58313955955517,0.0363230471916599\n4.6066056555458,0.034686678331604\n4.63007175153644,0.0336253856736586\n4.65353784752707,0.0330310415821457\n4.67700394351771,0.0329088119494924\n4.70047003950834,0.0332853095966733\n4.72393613549898,0.034074605079647\n4.74740223148961,0.0353050008600573\n4.77086832748025,0.0369437710637535\n4.79433442347088,0.0389346713187357\n4.81780051946152,0.0413133346664632\n4.84126661545215,0.0440016087874552\n4.86473271144279,0.0469737451832132\n4.88819880743342,0.0502319019268268\n4.91166490342406,0.0536994689174903\n4.93513099941469,0.0573596885607711\n4.95859709540533,0.0611727868175278\n4.98206319139596,0.0650845858409954\n5.0055292873866,0.0690625448997926\n5.02899538337723,0.073054448450008\n5.05246147936787,0.0770177515057958\n5.0759275753585,0.0808926599718601\n5.09939367134914,0.0846479612648478\n5.12285976733977,0.0882287774067613\n5.14632586333041,0.0915781162196236\n5.16979195932104,0.0946825828069427\n5.19325805531168,0.0974630656383904\n5.21672415130231,0.0999038074609484\n5.24019024729295,0.10199689700958\n5.26365634328358,0.103636132214907\n5.28712243927422,0.104876362760662\n5.31058853526485,0.105678210963512\n5.33405463125549,0.105991737776539\n5.35752072724612,0.105875999877197\n5.38098682323676,0.105278066834482\n5.40445291922739,0.104221730637657\n5.42791901521803,0.102755262955625\n5.45138511120866,0.100822121610224\n5.4748512071993,0.0985116212588494\n5.49831730318993,0.0958431761950774\n5.52178339918057,0.0928091563510123\n5.5452494951712,0.0894973863739413\n5.56871559116184,0.0859177346803468\n5.59218168715247,0.0821128653800113\n5.61564778314311,0.0781427681369737\n5.63911387913374,0.0740263647030907\n5.66257997512438,0.0698214666825946\n5.68604607111501,0.065566733331274\n5.70951216710565,0.0612987238240994\n5.73297826309628,0.0570549899176621\n5.75644435908692,0.0528708488687483\n5.77991045507755,0.0487812647557613\n5.80337655106819,0.0448011611297671\n5.82684264705882,0.040972798817257\n5.85030874304946,0.0373044403840629\n5.87377483904009,0.0338018282719775\n5.89724093503073,0.0305137421689991\n5.92070703102136,0.02741170956353\n5.944173127012,0.0245134888958932\n5.96763922300263,0.0218364984542014\n5.99110531899327,0.0193523804323015\n6.0145714149839,0.0170834811516878\n6.03803751097454,0.0150147552741877\n6.06150360696517,0.0131250651432092\n6.08496970295581,0.0114398163944226\n6.10843579894645,0.00991867478030012\n6.13190189493708,0.00855704008494726\n6.15536799092772,0.00736022989079235\n6.17883408691835,0.0062940952665126\n6.20230018290898,0.00536159351487882\n6.22576627889962,0.00454929609457793\n6.24923237489025,0.00383612098897806\n6.27269847088089,0.00322758920329379\n6.29616456687152,0.00270097417850955\n6.31963066286216,0.00224701018477414\n6.34309675885279,0.00186649434899076\n6.36656285484343,0.00154011874867967\n6.39002895083407,0.00126553506510706\n6.4134950468247,0.00103676805954035\n6.43696114281534,0.000843276202509978\n6.46042723880597,0.000684690514374704"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.177380037313432\n6.75961996268657"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.0253427585415707\n0.532197929372985"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "y2": {
            "scale": "y",
            "value": 0
          },
          "fillOpacity": {
            "value": 0.2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "stroke": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/density1"
          }
        }
      },
      "from": {
        "data": ".0/density1"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/density1"
          }
        }
      },
      "from": {
        "data": ".0/density1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "density"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id583819538").parseSpec(plot_id583819538_spec);
</script>
```
#### Checkbox input

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points(
    opacity := input_checkbox(label = "Semi-transparent",
                                    map = function(val) ifelse(val, .3, 1))) %>%
  layer_model_predictions(
    model = input_checkbox(label = "LOESS (curve) model fit",
                            map = function(val) ifelse(val, "loess", "lm")))
```

```{=html}
<div id="plot_id145219351-container" class="ggvis-output-container">
<div id="plot_id145219351" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id145219351_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id145219351" data-renderer="svg">SVG</a>
 | 
<a id="plot_id145219351_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id145219351" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id145219351_download" class="ggvis-download" data-plot-id="plot_id145219351">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id145219351_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number",
          "reactive_815243376": "number"
        }
      },
      "values": "\"wt\",\"mpg\",\"reactive_815243376\"\n2.62,21,1\n2.875,21,1\n2.32,22.8,1\n3.215,21.4,1\n3.44,18.7,1\n3.46,18.1,1\n3.57,14.3,1\n3.19,24.4,1\n3.15,22.8,1\n3.44,19.2,1\n3.44,17.8,1\n4.07,16.4,1\n3.73,17.3,1\n3.78,15.2,1\n5.25,10.4,1\n5.424,10.4,1\n5.345,14.7,1\n2.2,32.4,1\n1.615,30.4,1\n1.835,33.9,1\n2.465,21.5,1\n3.52,15.5,1\n3.435,15.2,1\n3.84,13.3,1\n3.845,19.2,1\n1.935,27.3,1\n2.14,26,1\n1.513,30.4,1\n3.17,15.8,1\n2.77,19.7,1\n3.57,15,1\n2.78,21.4,1"
    },
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,29.1989406778126\n1.56250632911392,28.9343555091934\n1.61201265822785,28.6697703405742\n1.66151898734177,28.4051851719549\n1.7110253164557,28.1406000033357\n1.76053164556962,27.8760148347165\n1.81003797468354,27.6114296660973\n1.85954430379747,27.3468444974781\n1.90905063291139,27.0822593288588\n1.95855696202532,26.8176741602396\n2.00806329113924,26.5530889916204\n2.05756962025316,26.2885038230012\n2.10707594936709,26.023918654382\n2.15658227848101,25.7593334857627\n2.20608860759494,25.4947483171435\n2.25559493670886,25.2301631485243\n2.30510126582278,24.9655779799051\n2.35460759493671,24.7009928112859\n2.40411392405063,24.4364076426666\n2.45362025316456,24.1718224740474\n2.50312658227848,23.9072373054282\n2.55263291139241,23.642652136809\n2.60213924050633,23.3780669681898\n2.65164556962025,23.1134817995705\n2.70115189873418,22.8488966309513\n2.7506582278481,22.5843114623321\n2.80016455696203,22.3197262937129\n2.84967088607595,22.0551411250937\n2.89917721518987,21.7905559564744\n2.9486835443038,21.5259707878552\n2.99818987341772,21.261385619236\n3.04769620253165,20.9968004506168\n3.09720253164557,20.7322152819976\n3.14670886075949,20.4676301133783\n3.19621518987342,20.2030449447591\n3.24572151898734,19.9384597761399\n3.29522784810127,19.6738746075207\n3.34473417721519,19.4092894389015\n3.39424050632911,19.1447042702822\n3.44374683544304,18.880119101663\n3.49325316455696,18.6155339330438\n3.54275949367089,18.3509487644246\n3.59226582278481,18.0863635958054\n3.64177215189873,17.8217784271861\n3.69127848101266,17.5571932585669\n3.74078481012658,17.2926080899477\n3.79029113924051,17.0280229213285\n3.83979746835443,16.7634377527093\n3.88930379746835,16.49885258409\n3.93881012658228,16.2342674154708\n3.9883164556962,15.9696822468516\n4.03782278481013,15.7050970782324\n4.08732911392405,15.4405119096132\n4.13683544303798,15.1759267409939\n4.1863417721519,14.9113415723747\n4.23584810126582,14.6467564037555\n4.28535443037975,14.3821712351363\n4.33486075949367,14.1175860665171\n4.3843670886076,13.8530008978978\n4.43387341772152,13.5884157292786\n4.48337974683544,13.3238305606594\n4.53288607594937,13.0592453920402\n4.58239240506329,12.794660223421\n4.63189873417722,12.5300750548017\n4.68140506329114,12.2654898861825\n4.73091139240506,12.0009047175633\n4.78041772151899,11.7363195489441\n4.82992405063291,11.4717343803249\n4.87943037974684,11.2071492117056\n4.92893670886076,10.9425640430864\n4.97844303797468,10.6779788744672\n5.02794936708861,10.413393705848\n5.07745569620253,10.1488085372288\n5.12696202531646,9.88422336860955\n5.17646835443038,9.61963819999033\n5.2259746835443,9.35505303137111\n5.27548101265823,9.09046786275189\n5.32498734177215,8.82588269413267\n5.37449367088608,8.56129752551345\n5.424,8.29671235689423"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n7.01654797473894\n35.1801643821553"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "opacity": {
            "field": "data.reactive_815243376"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id145219351").parseSpec(plot_id145219351_spec);
</script>
```

#### Text input

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points(fill := input_text(label = "Point color", value = "red")) %>%
  layer_model_predictions(model = input_text(label = "Model type", value = "loess"))
```

```{=html}
<div id="plot_id700390437-container" class="ggvis-output-container">
<div id="plot_id700390437" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id700390437_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id700390437" data-renderer="svg">SVG</a>
 | 
<a id="plot_id700390437_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id700390437" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id700390437_download" class="ggvis-download" data-plot-id="plot_id700390437">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id700390437_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\",\"reactive_423336911\"\n2.62,21,\"red\"\n2.875,21,\"red\"\n2.32,22.8,\"red\"\n3.215,21.4,\"red\"\n3.44,18.7,\"red\"\n3.46,18.1,\"red\"\n3.57,14.3,\"red\"\n3.19,24.4,\"red\"\n3.15,22.8,\"red\"\n3.44,19.2,\"red\"\n3.44,17.8,\"red\"\n4.07,16.4,\"red\"\n3.73,17.3,\"red\"\n3.78,15.2,\"red\"\n5.25,10.4,\"red\"\n5.424,10.4,\"red\"\n5.345,14.7,\"red\"\n2.2,32.4,\"red\"\n1.615,30.4,\"red\"\n1.835,33.9,\"red\"\n2.465,21.5,\"red\"\n3.52,15.5,\"red\"\n3.435,15.2,\"red\"\n3.84,13.3,\"red\"\n3.845,19.2,\"red\"\n1.935,27.3,\"red\"\n2.14,26,\"red\"\n1.513,30.4,\"red\"\n3.17,15.8,\"red\"\n2.77,19.7,\"red\"\n3.57,15,\"red\"\n2.78,21.4,\"red\""
    },
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,32.08897233857\n1.56250632911392,31.6878645869701\n1.61201265822785,31.2816303797919\n1.66151898734177,30.8703709543688\n1.7110253164557,30.4541875480347\n1.76053164556962,30.0331813981232\n1.81003797468354,29.6074537419678\n1.85954430379747,29.1771058169022\n1.90905063291139,28.7422388602601\n1.95855696202532,28.3001719301537\n2.00806329113924,27.834621969428\n2.05756962025316,27.3476575600419\n2.10707594936709,26.84497968394\n2.15658227848101,26.3322893230667\n2.20608860759494,25.8152874593666\n2.25559493670886,25.2996750747841\n2.30510126582278,24.7911531512637\n2.35460759493671,24.29542267075\n2.40411392405063,23.8181846151875\n2.45362025316456,23.3651399665205\n2.50312658227848,22.955253039598\n2.55263291139241,22.6138488714952\n2.60213924050633,22.3275852300224\n2.65164556962025,22.0817586181852\n2.70115189873418,21.8616655389892\n2.7506582278481,21.65260249544\n2.80016455696203,21.4398659905432\n2.84967088607595,21.2087525273044\n2.89917721518987,20.953335722037\n2.9486835443038,20.7158424594628\n2.99818987341772,20.4957065225374\n3.04769620253165,20.2829337645837\n3.09720253164557,20.0675300389245\n3.14670886075949,19.8395011988825\n3.19621518987342,19.5888530977805\n3.24572151898734,19.2971559094315\n3.29522784810127,18.9444093670088\n3.34473417721519,18.5670026794964\n3.39424050632911,18.2056968860288\n3.44374683544304,17.9009022641924\n3.49325316455696,17.620602502374\n3.54275949367089,17.3400153015964\n3.59226582278481,17.079077805285\n3.64177215189873,16.8175887231322\n3.69127848101266,16.5575726926136\n3.74078481012658,16.3083303048321\n3.79029113924051,16.0791621508901\n3.83979746835443,15.8793688218903\n3.88930379746835,15.7018119854881\n3.93881012658228,15.5259429561214\n3.9883164556962,15.3517253848296\n4.03782278481013,15.1793328075288\n4.08732911392405,15.0089387601353\n4.13683544303798,14.8407167785652\n4.1863417721519,14.6748403987346\n4.23584810126582,14.5114831565596\n4.28535443037975,14.3508185879563\n4.33486075949367,14.193020228841\n4.3843670886076,14.0382616151298\n4.43387341772152,13.8867162827388\n4.48337974683544,13.7385577675841\n4.53288607594937,13.5939596055819\n4.58239240506329,13.4530953326483\n4.63189873417722,13.3161384846995\n4.68140506329114,13.1832625976516\n4.73091139240506,13.0546412074207\n4.78041772151899,12.930447849923\n4.82992405063291,12.8108560610747\n4.87943037974684,12.6960393767918\n4.92893670886076,12.5861713329905\n4.97844303797468,12.4814254655869\n5.02794936708861,12.3819753104973\n5.07745569620253,12.2879944036376\n5.12696202531646,12.1996562809241\n5.17646835443038,12.117134478273\n5.2259746835443,12.0406025316002\n5.27548101265823,11.9702339768221\n5.32498734177215,11.9062023498547\n5.37449367088608,11.8486811866141\n5.424,11.7978440230166"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "fill": {
            "field": "data.reactive_423336911"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id700390437").parseSpec(plot_id700390437_spec);
</script>
```

#### Numeric input

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points(size := input_numeric(value = 25, label = "Point size")) %>%
  layer_smooths(span = input_numeric(value = 0.5, label = "Interpolation points"))
```

```{=html}
<div id="plot_id822755431-container" class="ggvis-output-container">
<div id="plot_id822755431" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id822755431_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id822755431" data-renderer="svg">SVG</a>
 | 
<a id="plot_id822755431_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id822755431" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id822755431_download" class="ggvis-download" data-plot-id="plot_id822755431">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id822755431_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number",
          "reactive_517636375": "number"
        }
      },
      "values": "\"wt\",\"mpg\",\"reactive_517636375\"\n2.62,21,25\n2.875,21,25\n2.32,22.8,25\n3.215,21.4,25\n3.44,18.7,25\n3.46,18.1,25\n3.57,14.3,25\n3.19,24.4,25\n3.15,22.8,25\n3.44,19.2,25\n3.44,17.8,25\n4.07,16.4,25\n3.73,17.3,25\n3.78,15.2,25\n5.25,10.4,25\n5.424,10.4,25\n5.345,14.7,25\n2.2,32.4,25\n1.615,30.4,25\n1.835,33.9,25\n2.465,21.5,25\n3.52,15.5,25\n3.435,15.2,25\n3.84,13.3,25\n3.845,19.2,25\n1.935,27.3,25\n2.14,26,25\n1.513,30.4,25\n3.17,15.8,25\n2.77,19.7,25\n3.57,15,25\n2.78,21.4,25"
    },
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,31.1578692505819\n1.56250632911392,31.0986698802032\n1.61201265822785,30.9960250236674\n1.66151898734177,30.8383424549115\n1.7110253164557,30.6393840227985\n1.76053164556962,30.402462560398\n1.81003797468354,30.1308363791107\n1.85954430379747,29.8277637903378\n1.90905063291139,29.4965031054802\n1.95855696202532,29.1340918645825\n2.00806329113924,28.708615118389\n2.05756962025316,28.2315702353424\n2.10707594936709,27.7227606790902\n2.15658227848101,27.2019899132795\n2.20608860759494,26.6870287695318\n2.25559493670886,26.0498911543942\n2.30510126582278,25.2716542771294\n2.35460759493671,24.4462603917728\n2.40411392405063,23.6676517523597\n2.45362025316456,23.0297706129253\n2.50312658227848,22.5366687667688\n2.55263291139241,22.043105457921\n2.60213924050633,21.570549028688\n2.65164556962025,21.1479030539244\n2.70115189873418,20.8040711084846\n2.7506582278481,20.5679567672234\n2.80016455696203,20.5569873525453\n2.84967088607595,20.8445160338316\n2.89917721518987,20.9150757299609\n2.9486835443038,21.0236783093429\n2.99818987341772,21.1931078212329\n3.04769620253165,21.3480628664792\n3.09720253164557,21.4132420459303\n3.14670886075949,21.3133439604345\n3.19621518987342,21.0111564991249\n3.24572151898734,20.5411184425284\n3.29522784810127,19.8057099685569\n3.34473417721519,18.9323662081205\n3.39424050632911,18.0620855801734\n3.44374683544304,17.3226686118672\n3.49325316455696,16.5274083695918\n3.54275949367089,15.8723922871438\n3.59226582278481,15.4663920667705\n3.64177215189873,15.3537231538096\n3.69127848101266,15.4388816990418\n3.74078481012658,15.5860801145833\n3.79029113924051,15.6670179988257\n3.83979746835443,15.7678124698591\n3.88930379746835,15.8617856545769\n3.93881012658228,15.9278944039487\n3.9883164556962,15.9675915666615\n4.03782278481013,15.9822130539336\n4.08732911392405,15.9730947769829\n4.13683544303798,15.9415726470276\n4.1863417721519,15.8889825752859\n4.23584810126582,15.8166604729758\n4.28535443037975,15.7259422513154\n4.33486075949367,15.6181638215229\n4.3843670886076,15.4946610948164\n4.43387341772152,15.356769982414\n4.48337974683544,15.2058263955337\n4.53288607594937,15.0431662453937\n4.58239240506329,14.8701254432122\n4.63189873417722,14.6880399002072\n4.68140506329114,14.4982455275968\n4.73091139240506,14.3020782365992\n4.78041772151899,14.1008739384324\n4.82992405063291,13.8959685443146\n4.87943037974684,13.6886979654639\n4.92893670886076,13.4803981130983\n4.97844303797468,13.2724048984361\n5.02794936708861,13.0660542326953\n5.07745569620253,12.862682027094\n5.12696202531646,12.6636241928504\n5.17646835443038,12.4702166411825\n5.2259746835443,12.2837952833085\n5.27548101265823,12.1047883164442\n5.32498734177215,11.9291725392028\n5.37449367088608,11.7569216240903\n5.424,11.5887935207892"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "size": {
            "field": "data.reactive_517636375"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id822755431").parseSpec(plot_id822755431_spec);
</script>
```

#### Radio buttons

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points() %>%
  layer_model_predictions(
    model = input_radiobuttons(c("LOESS" = "loess", "Linear" = "lm"),
      label = "Model type"),
    stroke := input_radiobuttons(c("Red" = "red", "Black" = "black"),
      label = "Line color")
  )
```

```{=html}
<div id="plot_id734476695-container" class="ggvis-output-container">
<div id="plot_id734476695" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id734476695_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id734476695" data-renderer="svg">SVG</a>
 | 
<a id="plot_id734476695_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id734476695" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id734476695_download" class="ggvis-download" data-plot-id="plot_id734476695">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id734476695_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\",\"reactive_745260964\"\n1.513,32.08897233857,\"red\"\n1.56250632911392,31.6878645869701,\"red\"\n1.61201265822785,31.2816303797919,\"red\"\n1.66151898734177,30.8703709543688,\"red\"\n1.7110253164557,30.4541875480347,\"red\"\n1.76053164556962,30.0331813981232,\"red\"\n1.81003797468354,29.6074537419678,\"red\"\n1.85954430379747,29.1771058169022,\"red\"\n1.90905063291139,28.7422388602601,\"red\"\n1.95855696202532,28.3001719301537,\"red\"\n2.00806329113924,27.834621969428,\"red\"\n2.05756962025316,27.3476575600419,\"red\"\n2.10707594936709,26.84497968394,\"red\"\n2.15658227848101,26.3322893230667,\"red\"\n2.20608860759494,25.8152874593666,\"red\"\n2.25559493670886,25.2996750747841,\"red\"\n2.30510126582278,24.7911531512637,\"red\"\n2.35460759493671,24.29542267075,\"red\"\n2.40411392405063,23.8181846151875,\"red\"\n2.45362025316456,23.3651399665205,\"red\"\n2.50312658227848,22.955253039598,\"red\"\n2.55263291139241,22.6138488714952,\"red\"\n2.60213924050633,22.3275852300224,\"red\"\n2.65164556962025,22.0817586181852,\"red\"\n2.70115189873418,21.8616655389892,\"red\"\n2.7506582278481,21.65260249544,\"red\"\n2.80016455696203,21.4398659905432,\"red\"\n2.84967088607595,21.2087525273044,\"red\"\n2.89917721518987,20.953335722037,\"red\"\n2.9486835443038,20.7158424594628,\"red\"\n2.99818987341772,20.4957065225374,\"red\"\n3.04769620253165,20.2829337645837,\"red\"\n3.09720253164557,20.0675300389245,\"red\"\n3.14670886075949,19.8395011988825,\"red\"\n3.19621518987342,19.5888530977805,\"red\"\n3.24572151898734,19.2971559094315,\"red\"\n3.29522784810127,18.9444093670088,\"red\"\n3.34473417721519,18.5670026794964,\"red\"\n3.39424050632911,18.2056968860288,\"red\"\n3.44374683544304,17.9009022641924,\"red\"\n3.49325316455696,17.620602502374,\"red\"\n3.54275949367089,17.3400153015964,\"red\"\n3.59226582278481,17.079077805285,\"red\"\n3.64177215189873,16.8175887231322,\"red\"\n3.69127848101266,16.5575726926136,\"red\"\n3.74078481012658,16.3083303048321,\"red\"\n3.79029113924051,16.0791621508901,\"red\"\n3.83979746835443,15.8793688218903,\"red\"\n3.88930379746835,15.7018119854881,\"red\"\n3.93881012658228,15.5259429561214,\"red\"\n3.9883164556962,15.3517253848296,\"red\"\n4.03782278481013,15.1793328075288,\"red\"\n4.08732911392405,15.0089387601353,\"red\"\n4.13683544303798,14.8407167785652,\"red\"\n4.1863417721519,14.6748403987346,\"red\"\n4.23584810126582,14.5114831565596,\"red\"\n4.28535443037975,14.3508185879563,\"red\"\n4.33486075949367,14.193020228841,\"red\"\n4.3843670886076,14.0382616151298,\"red\"\n4.43387341772152,13.8867162827388,\"red\"\n4.48337974683544,13.7385577675841,\"red\"\n4.53288607594937,13.5939596055819,\"red\"\n4.58239240506329,13.4530953326483,\"red\"\n4.63189873417722,13.3161384846995,\"red\"\n4.68140506329114,13.1832625976516,\"red\"\n4.73091139240506,13.0546412074207,\"red\"\n4.78041772151899,12.930447849923,\"red\"\n4.82992405063291,12.8108560610747,\"red\"\n4.87943037974684,12.6960393767918,\"red\"\n4.92893670886076,12.5861713329905,\"red\"\n4.97844303797468,12.4814254655869,\"red\"\n5.02794936708861,12.3819753104973,\"red\"\n5.07745569620253,12.2879944036376,\"red\"\n5.12696202531646,12.1996562809241,\"red\"\n5.17646835443038,12.117134478273,\"red\"\n5.2259746835443,12.0406025316002,\"red\"\n5.27548101265823,11.9702339768221,\"red\"\n5.32498734177215,11.9062023498547,\"red\"\n5.37449367088608,11.8486811866141,\"red\"\n5.424,11.7978440230166,\"red\""
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "stroke": {
            "field": "data.reactive_745260964"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id734476695").parseSpec(plot_id734476695_spec);
</script>
```


#### Checkbox group

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points(
    fill := input_checkboxgroup(
      choices = c("Red" = "r", "Green" = "g", "Blue" = "b"),
      label = "Point color components",
      map = function(val) {
        rgb(0.8 * "r" %in% val, 0.8 * "g" %in% val, 0.8 * "b" %in% val)
      }
    )
  )
```

```{=html}
<div id="plot_id362544887-container" class="ggvis-output-container">
<div id="plot_id362544887" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id362544887_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id362544887" data-renderer="svg">SVG</a>
 | 
<a id="plot_id362544887_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id362544887" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id362544887_download" class="ggvis-download" data-plot-id="plot_id362544887">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id362544887_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\",\"reactive_545741258\"\n2.62,21,\"#000000\"\n2.875,21,\"#000000\"\n2.32,22.8,\"#000000\"\n3.215,21.4,\"#000000\"\n3.44,18.7,\"#000000\"\n3.46,18.1,\"#000000\"\n3.57,14.3,\"#000000\"\n3.19,24.4,\"#000000\"\n3.15,22.8,\"#000000\"\n3.44,19.2,\"#000000\"\n3.44,17.8,\"#000000\"\n4.07,16.4,\"#000000\"\n3.73,17.3,\"#000000\"\n3.78,15.2,\"#000000\"\n5.25,10.4,\"#000000\"\n5.424,10.4,\"#000000\"\n5.345,14.7,\"#000000\"\n2.2,32.4,\"#000000\"\n1.615,30.4,\"#000000\"\n1.835,33.9,\"#000000\"\n2.465,21.5,\"#000000\"\n3.52,15.5,\"#000000\"\n3.435,15.2,\"#000000\"\n3.84,13.3,\"#000000\"\n3.845,19.2,\"#000000\"\n1.935,27.3,\"#000000\"\n2.14,26,\"#000000\"\n1.513,30.4,\"#000000\"\n3.17,15.8,\"#000000\"\n2.77,19.7,\"#000000\"\n3.57,15,\"#000000\"\n2.78,21.4,\"#000000\""
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "fill": {
            "field": "data.reactive_545741258"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id362544887").parseSpec(plot_id362544887_spec);
</script>
```

### Map

#### Example with value map function

```r
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points() %>%
  layer_model_predictions(model = "loess",
    model_args = list(n = input_select(
      choices = c("Two", "Six", "Eighty"),
      map = function(value) switch(value, Two = 2, Six = 6, Eighty = 80),
      label = "Number of points"
    ))
  )
```

```{=html}
<div id="plot_id799545801-container" class="ggvis-output-container">
<div id="plot_id799545801" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id799545801_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id799545801" data-renderer="svg">SVG</a>
 | 
<a id="plot_id799545801_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id799545801" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id799545801_download" class="ggvis-download" data-plot-id="plot_id799545801">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id799545801_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,32.08897233857\n5.424,11.7978440230166"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    },
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id799545801").parseSpec(plot_id799545801_spec);
</script>
```


```r
new_vals <- input_select(c("Set A" = "A", "Set B" = "B"),
  label = "Dynamically-generated column",
  map = function(value) {
    vals <- switch(value,
      "A" = rep(c("One", "Two")),
      "B" = c("First", "Second", "Third", "Fourth"))
    rep(vals, length = nrow(mtcars))
  })

mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = new_vals) %>%
  layer_points()
```

```{=html}
<div id="plot_id894510863-container" class="ggvis-output-container">
<div id="plot_id894510863" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id894510863_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id894510863" data-renderer="svg">SVG</a>
 | 
<a id="plot_id894510863_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id894510863" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id894510863_download" class="ggvis-download" data-plot-id="plot_id894510863">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id894510863_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\",\"reactive_299414618\"\n2.62,21,\"One\"\n2.875,21,\"Two\"\n2.32,22.8,\"One\"\n3.215,21.4,\"Two\"\n3.44,18.7,\"One\"\n3.46,18.1,\"Two\"\n3.57,14.3,\"One\"\n3.19,24.4,\"Two\"\n3.15,22.8,\"One\"\n3.44,19.2,\"Two\"\n3.44,17.8,\"One\"\n4.07,16.4,\"Two\"\n3.73,17.3,\"One\"\n3.78,15.2,\"Two\"\n5.25,10.4,\"One\"\n5.424,10.4,\"Two\"\n5.345,14.7,\"One\"\n2.2,32.4,\"Two\"\n1.615,30.4,\"One\"\n1.835,33.9,\"Two\"\n2.465,21.5,\"One\"\n3.52,15.5,\"Two\"\n3.435,15.2,\"One\"\n3.84,13.3,\"Two\"\n3.845,19.2,\"One\"\n1.935,27.3,\"Two\"\n2.14,26,\"One\"\n1.513,30.4,\"Two\"\n3.17,15.8,\"One\"\n2.77,19.7,\"Two\"\n3.57,15,\"One\"\n2.78,21.4,\"Two\""
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"One\"\n\"Two\""
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "fill",
      "type": "ordinal",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": "category10"
    },
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "fill": {
            "scale": "fill",
            "field": "data.reactive_299414618"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
      "title": "reactive_299414618"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id894510863").parseSpec(plot_id894510863_spec);
</script>
```

```r
mtcars %>% ggvis(
    x = ~wt,
    y = ~mpg,
    fill = input_select(c("mpg", "wt"), map = as.name)
  ) %>%
  layer_points()
```

```{=html}
<div id="plot_id779087953-container" class="ggvis-output-container">
<div id="plot_id779087953" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id779087953_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id779087953" data-renderer="svg">SVG</a>
 | 
<a id="plot_id779087953_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id779087953" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id779087953_download" class="ggvis-download" data-plot-id="plot_id779087953">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id779087953_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number",
          "reactive_201721588": "number"
        }
      },
      "values": "\"wt\",\"mpg\",\"reactive_201721588\"\n2.62,21,21\n2.875,21,21\n2.32,22.8,22.8\n3.215,21.4,21.4\n3.44,18.7,18.7\n3.46,18.1,18.1\n3.57,14.3,14.3\n3.19,24.4,24.4\n3.15,22.8,22.8\n3.44,19.2,19.2\n3.44,17.8,17.8\n4.07,16.4,16.4\n3.73,17.3,17.3\n3.78,15.2,15.2\n5.25,10.4,10.4\n5.424,10.4,10.4\n5.345,14.7,14.7\n2.2,32.4,32.4\n1.615,30.4,30.4\n1.835,33.9,33.9\n2.465,21.5,21.5\n3.52,15.5,15.5\n3.435,15.2,15.2\n3.84,13.3,13.3\n3.845,19.2,19.2\n1.935,27.3,27.3\n2.14,26,26\n1.513,30.4,30.4\n3.17,15.8,15.8\n2.77,19.7,19.7\n3.57,15,15\n2.78,21.4,21.4"
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n10.4\n33.9"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "fill",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": ["#132B43", "#56B1F7"]
    },
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          },
          "fill": {
            "scale": "fill",
            "field": "data.reactive_201721588"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
      "title": "reactive_201721588"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id779087953").parseSpec(plot_id779087953_spec);
</script>
```


## Layers

### Simple layers

include primitives like points, lines and rectangles.


```r
mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points()
```

```{=html}
<div id="plot_id594813340-container" class="ggvis-output-container">
<div id="plot_id594813340" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id594813340_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id594813340" data-renderer="svg">SVG</a>
 | 
<a id="plot_id594813340_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id594813340" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id594813340_download" class="ggvis-download" data-plot-id="plot_id594813340">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id594813340_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "mpg": "number"
        }
      },
      "values": "\"wt\",\"mpg\"\n2.62,21\n2.875,21\n2.32,22.8\n3.215,21.4\n3.44,18.7\n3.46,18.1\n3.57,14.3\n3.19,24.4\n3.15,22.8\n3.44,19.2\n3.44,17.8\n4.07,16.4\n3.73,17.3\n3.78,15.2\n5.25,10.4\n5.424,10.4\n5.345,14.7\n2.2,32.4\n1.615,30.4\n1.835,33.9\n2.465,21.5\n3.52,15.5\n3.435,15.2\n3.84,13.3\n3.845,19.2\n1.935,27.3\n2.14,26\n1.513,30.4\n3.17,15.8\n2.77,19.7\n3.57,15\n2.78,21.4"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n9.225\n35.075"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.mpg"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id594813340").parseSpec(plot_id594813340_spec);
</script>
```

Paths and polygons


```r
df <- data.frame(x = 1:10, y = runif(10))
df %>% ggvis(~x, ~y) %>% layer_paths()
```

```{=html}
<div id="plot_id679021188-container" class="ggvis-output-container">
<div id="plot_id679021188" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id679021188_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id679021188" data-renderer="svg">SVG</a>
 | 
<a id="plot_id679021188_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id679021188" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id679021188_download" class="ggvis-download" data-plot-id="plot_id679021188">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id679021188_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n1,0.470083595253527\n2,0.0706543999258429\n3,0.451782792108133\n4,0.490207371301949\n5,0.968698979821056\n6,0.743949386756867\n7,0.652317114640027\n8,0.443890069844201\n9,0.961836907081306\n10,0.330603770213202"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.55\n10.45"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.0257521709310822\n1.01360120881582"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id679021188").parseSpec(plot_id679021188_spec);
</script>
```

If you add `fill`, you will get a polygon

```r
t <- seq(0, 2 * pi, length = 100)
df <- data.frame(x = sin(t), y = cos(t))
df %>% ggvis(~x, ~y) %>% layer_paths(fill := "red")
```

```{=html}
<div id="plot_id110888764-container" class="ggvis-output-container">
<div id="plot_id110888764" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id110888764_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id110888764" data-renderer="svg">SVG</a>
 | 
<a id="plot_id110888764_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id110888764" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id110888764_download" class="ggvis-download" data-plot-id="plot_id110888764">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id110888764_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n0,1\n0.0634239196565645,0.997986676471884\n0.126592453573749,0.991954812830795\n0.18925124436041,0.981928697262707\n0.251147987181079,0.967948701396356\n0.312033445698487,0.950071117740945\n0.371662455660328,0.928367933016073\n0.429794912089172,0.902926538286621\n0.486196736100469,0.873849377069785\n0.540640817455598,0.841253532831181\n0.59290792905464,0.805270257531059\n0.642787609686539,0.766044443118978\n0.690079011482112,0.72373403810507\n0.734591708657533,0.678509411557132\n0.776146464291757,0.630552667084523\n0.814575952050336,0.580056909571198\n0.849725429949514,0.527225467610502\n0.881453363447582,0.472271074772683\n0.909631995354518,0.415415013001886\n0.934147860265107,0.356886221591872\n0.954902241444074,0.296920375328275\n0.971811568323542,0.235758935509427\n0.984807753012208,0.17364817766693\n0.993838464461254,0.110838199901011\n0.998867339183008,0.0475819158237422\n0.999874127673875,-0.015865963834808\n0.996854775951942,-0.0792499568567885\n0.989821441880933,-0.142314838273285\n0.978802446214779,-0.204806668065191\n0.963842158559942,-0.266473813690035\n0.945000818714668,-0.327067963317422\n0.922354294104581,-0.386345125693129\n0.895993774291336,-0.444066612605774\n0.866025403784438,-0.5\n0.832569854634771,-0.55392006386611\n0.795761840530832,-0.605609687137667\n0.755749574354258,-0.654860733945285\n0.712694171378863,-0.701474887706321\n0.666769000516292,-0.745264449675755\n0.618158986220605,-0.786053094742788\n0.567059863862771,-0.823676581429833\n0.513677391573406,-0.857983413234977\n0.458226521727411,-0.888835448654923\n0.400930535406614,-0.91610845743207\n0.342020143325669,-0.939692620785908\n0.28173255684143,-0.959492973614497\n0.220310532786541,-0.975429786885407\n0.15800139597335,-0.987438888676394\n0.0950560433041824,-0.995471922573085\n0.0317279334980677,-0.999496542383185\n-0.0317279334980679,-0.999496542383185\n-0.0950560433041826,-0.995471922573085\n-0.15800139597335,-0.987438888676394\n-0.220310532786541,-0.975429786885407\n-0.28173255684143,-0.959492973614497\n-0.342020143325669,-0.939692620785908\n-0.400930535406614,-0.91610845743207\n-0.45822652172741,-0.888835448654923\n-0.513677391573406,-0.857983413234977\n-0.567059863862771,-0.823676581429833\n-0.618158986220605,-0.786053094742787\n-0.666769000516292,-0.745264449675755\n-0.712694171378863,-0.701474887706321\n-0.755749574354258,-0.654860733945285\n-0.795761840530832,-0.605609687137667\n-0.832569854634771,-0.55392006386611\n-0.866025403784439,-0.5\n-0.895993774291336,-0.444066612605774\n-0.922354294104581,-0.386345125693129\n-0.945000818714668,-0.327067963317422\n-0.963842158559942,-0.266473813690035\n-0.978802446214779,-0.204806668065191\n-0.989821441880933,-0.142314838273285\n-0.996854775951942,-0.0792499568567888\n-0.999874127673875,-0.0158659638348076\n-0.998867339183008,0.0475819158237424\n-0.993838464461254,0.110838199901011\n-0.984807753012208,0.17364817766693\n-0.971811568323542,0.235758935509427\n-0.954902241444074,0.296920375328275\n-0.934147860265107,0.356886221591872\n-0.909631995354518,0.415415013001887\n-0.881453363447582,0.472271074772683\n-0.849725429949514,0.527225467610502\n-0.814575952050336,0.580056909571198\n-0.776146464291757,0.630552667084523\n-0.734591708657533,0.678509411557132\n-0.690079011482112,0.72373403810507\n-0.64278760968654,0.766044443118978\n-0.59290792905464,0.805270257531059\n-0.540640817455597,0.841253532831181\n-0.486196736100469,0.873849377069785\n-0.429794912089172,0.902926538286621\n-0.371662455660327,0.928367933016073\n-0.312033445698487,0.950071117740945\n-0.251147987181079,0.967948701396356\n-0.18925124436041,0.981928697262707\n-0.126592453573749,0.991954812830795\n-0.0634239196565645,0.997986676471884\n-2.44929359829471e-16,1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09986154044126\n1.09986154044126"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09947136950234\n1.09997482711916"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "fill": {
            "value": "red"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id110888764").parseSpec(plot_id110888764_spec);
</script>
```



```r
df <- data.frame(x = 1:10, y = runif(10))
df %>% ggvis(~x, ~y) %>% layer_ribbons()
```

```{=html}
<div id="plot_id679567666-container" class="ggvis-output-container">
<div id="plot_id679567666" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id679567666_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id679567666" data-renderer="svg">SVG</a>
 | 
<a id="plot_id679567666_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id679567666" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id679567666_download" class="ggvis-download" data-plot-id="plot_id679567666">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id679567666_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n1,0.669689851580188\n2,0.20776499598287\n3,0.407382257748395\n4,0.843437407165766\n5,0.677137265447527\n6,0.30219277809374\n7,0.163119055330753\n8,0.87822147179395\n9,0.95645432267338\n10,0.458520476007834"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.55\n10.45"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.123452291963622\n0.996121086040512"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "area",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id679567666").parseSpec(plot_id679567666_spec);
</script>
```

Rectangle


```r
set.seed(1014)
df <- data.frame(x1 = runif(5), x2 = runif(5), y1 = runif(5), y2 = runif(5))
df %>% ggvis(~x1, ~y1, x2 = ~x2, y2 = ~y2, fillOpacity := 0.1) %>% layer_rects()
```

```{=html}
<div id="plot_id360903065-container" class="ggvis-output-container">
<div id="plot_id360903065" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id360903065_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id360903065" data-renderer="svg">SVG</a>
 | 
<a id="plot_id360903065_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id360903065" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id360903065_download" class="ggvis-download" data-plot-id="plot_id360903065">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id360903065_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x2": "number",
          "y2": "number",
          "x1": "number",
          "y1": "number"
        }
      },
      "values": "\"x2\",\"y2\",\"x1\",\"y1\"\n0.466393497306854,0.195669834734872,0.0807501375675201,0.874600660754368\n0.497777388663962,0.403538117418066,0.834333037259057,0.174940626835451\n0.289767244597897,0.0636614572722465,0.600760886212811,0.0342413326725364\n0.732881987001747,0.388701313175261,0.157208441523835,0.320385730825365\n0.772521511185914,0.975547835230827,0.0073994412086904,0.402328238356858"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.0339472385938279\n0.875679717061576"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-0.0128239924553782\n1.02261316035874"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "value": "#333333"
          },
          "x2": {
            "scale": "x",
            "field": "data.x2"
          },
          "y2": {
            "scale": "y",
            "field": "data.y2"
          },
          "fillOpacity": {
            "value": 0.1
          },
          "x": {
            "scale": "x",
            "field": "data.x1"
          },
          "y": {
            "scale": "y",
            "field": "data.y1"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x1"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y1"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id360903065").parseSpec(plot_id360903065_spec);
</script>
```

Text


```r
df <- data.frame(x = 3:1, y = c(1, 3, 2), label = c("a", "b", "c"))

df %>% ggvis(~x, ~y, text := ~label) %>% layer_text(fontSize := 50)
```

```{=html}
<div id="plot_id710542383-container" class="ggvis-output-container">
<div id="plot_id710542383" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id710542383_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id710542383" data-renderer="svg">SVG</a>
 | 
<a id="plot_id710542383_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id710542383" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id710542383_download" class="ggvis-download" data-plot-id="plot_id710542383">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id710542383_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"label\",\"x\",\"y\"\n\"a\",3,1\n\"b\",2,3\n\"c\",1,2"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.9\n3.1"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0.9\n3.1"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "text",
      "properties": {
        "update": {
          "fill": {
            "value": "#333333"
          },
          "text": {
            "field": "data.label"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          },
          "fontSize": {
            "value": 50
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id710542383").parseSpec(plot_id710542383_spec);
</script>
```

### Compound layers


```r
df <- data.frame(x = sin(t), y = cos(t))

df %>% ggvis(~x, ~y) %>% layer_paths()
```

```{=html}
<div id="plot_id761787638-container" class="ggvis-output-container">
<div id="plot_id761787638" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id761787638_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id761787638" data-renderer="svg">SVG</a>
 | 
<a id="plot_id761787638_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id761787638" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id761787638_download" class="ggvis-download" data-plot-id="plot_id761787638">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id761787638_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n0,1\n0.0634239196565645,0.997986676471884\n0.126592453573749,0.991954812830795\n0.18925124436041,0.981928697262707\n0.251147987181079,0.967948701396356\n0.312033445698487,0.950071117740945\n0.371662455660328,0.928367933016073\n0.429794912089172,0.902926538286621\n0.486196736100469,0.873849377069785\n0.540640817455598,0.841253532831181\n0.59290792905464,0.805270257531059\n0.642787609686539,0.766044443118978\n0.690079011482112,0.72373403810507\n0.734591708657533,0.678509411557132\n0.776146464291757,0.630552667084523\n0.814575952050336,0.580056909571198\n0.849725429949514,0.527225467610502\n0.881453363447582,0.472271074772683\n0.909631995354518,0.415415013001886\n0.934147860265107,0.356886221591872\n0.954902241444074,0.296920375328275\n0.971811568323542,0.235758935509427\n0.984807753012208,0.17364817766693\n0.993838464461254,0.110838199901011\n0.998867339183008,0.0475819158237422\n0.999874127673875,-0.015865963834808\n0.996854775951942,-0.0792499568567885\n0.989821441880933,-0.142314838273285\n0.978802446214779,-0.204806668065191\n0.963842158559942,-0.266473813690035\n0.945000818714668,-0.327067963317422\n0.922354294104581,-0.386345125693129\n0.895993774291336,-0.444066612605774\n0.866025403784438,-0.5\n0.832569854634771,-0.55392006386611\n0.795761840530832,-0.605609687137667\n0.755749574354258,-0.654860733945285\n0.712694171378863,-0.701474887706321\n0.666769000516292,-0.745264449675755\n0.618158986220605,-0.786053094742788\n0.567059863862771,-0.823676581429833\n0.513677391573406,-0.857983413234977\n0.458226521727411,-0.888835448654923\n0.400930535406614,-0.91610845743207\n0.342020143325669,-0.939692620785908\n0.28173255684143,-0.959492973614497\n0.220310532786541,-0.975429786885407\n0.15800139597335,-0.987438888676394\n0.0950560433041824,-0.995471922573085\n0.0317279334980677,-0.999496542383185\n-0.0317279334980679,-0.999496542383185\n-0.0950560433041826,-0.995471922573085\n-0.15800139597335,-0.987438888676394\n-0.220310532786541,-0.975429786885407\n-0.28173255684143,-0.959492973614497\n-0.342020143325669,-0.939692620785908\n-0.400930535406614,-0.91610845743207\n-0.45822652172741,-0.888835448654923\n-0.513677391573406,-0.857983413234977\n-0.567059863862771,-0.823676581429833\n-0.618158986220605,-0.786053094742787\n-0.666769000516292,-0.745264449675755\n-0.712694171378863,-0.701474887706321\n-0.755749574354258,-0.654860733945285\n-0.795761840530832,-0.605609687137667\n-0.832569854634771,-0.55392006386611\n-0.866025403784439,-0.5\n-0.895993774291336,-0.444066612605774\n-0.922354294104581,-0.386345125693129\n-0.945000818714668,-0.327067963317422\n-0.963842158559942,-0.266473813690035\n-0.978802446214779,-0.204806668065191\n-0.989821441880933,-0.142314838273285\n-0.996854775951942,-0.0792499568567888\n-0.999874127673875,-0.0158659638348076\n-0.998867339183008,0.0475819158237424\n-0.993838464461254,0.110838199901011\n-0.984807753012208,0.17364817766693\n-0.971811568323542,0.235758935509427\n-0.954902241444074,0.296920375328275\n-0.934147860265107,0.356886221591872\n-0.909631995354518,0.415415013001887\n-0.881453363447582,0.472271074772683\n-0.849725429949514,0.527225467610502\n-0.814575952050336,0.580056909571198\n-0.776146464291757,0.630552667084523\n-0.734591708657533,0.678509411557132\n-0.690079011482112,0.72373403810507\n-0.64278760968654,0.766044443118978\n-0.59290792905464,0.805270257531059\n-0.540640817455597,0.841253532831181\n-0.486196736100469,0.873849377069785\n-0.429794912089172,0.902926538286621\n-0.371662455660327,0.928367933016073\n-0.312033445698487,0.950071117740945\n-0.251147987181079,0.967948701396356\n-0.18925124436041,0.981928697262707\n-0.126592453573749,0.991954812830795\n-0.0634239196565645,0.997986676471884\n-2.44929359829471e-16,1"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09986154044126\n1.09986154044126"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09947136950234\n1.09997482711916"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id761787638").parseSpec(plot_id761787638_spec);
</script>
```


```r
df %>% ggvis(~x, ~y) %>% layer_lines()
```

```{=html}
<div id="plot_id276361059-container" class="ggvis-output-container">
<div id="plot_id276361059" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id276361059_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id276361059" data-renderer="svg">SVG</a>
 | 
<a id="plot_id276361059_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id276361059" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id276361059_download" class="ggvis-download" data-plot-id="plot_id276361059">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id276361059_spec = {
  "data": [
    {
      "name": ".0/arrange1",
      "format": {
        "type": "csv",
        "parse": {
          "x": "number",
          "y": "number"
        }
      },
      "values": "\"x\",\"y\"\n-0.999874127673875,-0.0158659638348076\n-0.998867339183008,0.0475819158237424\n-0.996854775951942,-0.0792499568567888\n-0.993838464461254,0.110838199901011\n-0.989821441880933,-0.142314838273285\n-0.984807753012208,0.17364817766693\n-0.978802446214779,-0.204806668065191\n-0.971811568323542,0.235758935509427\n-0.963842158559942,-0.266473813690035\n-0.954902241444074,0.296920375328275\n-0.945000818714668,-0.327067963317422\n-0.934147860265107,0.356886221591872\n-0.922354294104581,-0.386345125693129\n-0.909631995354518,0.415415013001887\n-0.895993774291336,-0.444066612605774\n-0.881453363447582,0.472271074772683\n-0.866025403784439,-0.5\n-0.849725429949514,0.527225467610502\n-0.832569854634771,-0.55392006386611\n-0.814575952050336,0.580056909571198\n-0.795761840530832,-0.605609687137667\n-0.776146464291757,0.630552667084523\n-0.755749574354258,-0.654860733945285\n-0.734591708657533,0.678509411557132\n-0.712694171378863,-0.701474887706321\n-0.690079011482112,0.72373403810507\n-0.666769000516292,-0.745264449675755\n-0.64278760968654,0.766044443118978\n-0.618158986220605,-0.786053094742787\n-0.59290792905464,0.805270257531059\n-0.567059863862771,-0.823676581429833\n-0.540640817455597,0.841253532831181\n-0.513677391573406,-0.857983413234977\n-0.486196736100469,0.873849377069785\n-0.45822652172741,-0.888835448654923\n-0.429794912089172,0.902926538286621\n-0.400930535406614,-0.91610845743207\n-0.371662455660327,0.928367933016073\n-0.342020143325669,-0.939692620785908\n-0.312033445698487,0.950071117740945\n-0.28173255684143,-0.959492973614497\n-0.251147987181079,0.967948701396356\n-0.220310532786541,-0.975429786885407\n-0.18925124436041,0.981928697262707\n-0.15800139597335,-0.987438888676394\n-0.126592453573749,0.991954812830795\n-0.0950560433041826,-0.995471922573085\n-0.0634239196565645,0.997986676471884\n-0.0317279334980679,-0.999496542383185\n-2.44929359829471e-16,1\n0,1\n0.0317279334980677,-0.999496542383185\n0.0634239196565645,0.997986676471884\n0.0950560433041824,-0.995471922573085\n0.126592453573749,0.991954812830795\n0.15800139597335,-0.987438888676394\n0.18925124436041,0.981928697262707\n0.220310532786541,-0.975429786885407\n0.251147987181079,0.967948701396356\n0.28173255684143,-0.959492973614497\n0.312033445698487,0.950071117740945\n0.342020143325669,-0.939692620785908\n0.371662455660328,0.928367933016073\n0.400930535406614,-0.91610845743207\n0.429794912089172,0.902926538286621\n0.458226521727411,-0.888835448654923\n0.486196736100469,0.873849377069785\n0.513677391573406,-0.857983413234977\n0.540640817455598,0.841253532831181\n0.567059863862771,-0.823676581429833\n0.59290792905464,0.805270257531059\n0.618158986220605,-0.786053094742788\n0.642787609686539,0.766044443118978\n0.666769000516292,-0.745264449675755\n0.690079011482112,0.72373403810507\n0.712694171378863,-0.701474887706321\n0.734591708657533,0.678509411557132\n0.755749574354258,-0.654860733945285\n0.776146464291757,0.630552667084523\n0.795761840530832,-0.605609687137667\n0.814575952050336,0.580056909571198\n0.832569854634771,-0.55392006386611\n0.849725429949514,0.527225467610502\n0.866025403784438,-0.5\n0.881453363447582,0.472271074772683\n0.895993774291336,-0.444066612605774\n0.909631995354518,0.415415013001886\n0.922354294104581,-0.386345125693129\n0.934147860265107,0.356886221591872\n0.945000818714668,-0.327067963317422\n0.954902241444074,0.296920375328275\n0.963842158559942,-0.266473813690035\n0.971811568323542,0.235758935509427\n0.978802446214779,-0.204806668065191\n0.984807753012208,0.17364817766693\n0.989821441880933,-0.142314838273285\n0.993838464461254,0.110838199901011\n0.996854775951942,-0.0792499568567885\n0.998867339183008,0.0475819158237422\n0.999874127673875,-0.015865963834808"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09986154044126\n1.09986154044126"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n-1.09947136950234\n1.09997482711916"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "x": {
            "scale": "x",
            "field": "data.x"
          },
          "y": {
            "scale": "y",
            "field": "data.y"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/arrange1"
          }
        }
      },
      "from": {
        "data": ".0/arrange1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "x"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "y"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id276361059").parseSpec(plot_id276361059_spec);
</script>
```


```r
mtcars %>% ggvis(~mpg) %>% layer_histograms()
```

```{=html}
<div id="plot_id982485706-container" class="ggvis-output-container">
<div id="plot_id982485706" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id982485706_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id982485706" data-renderer="svg">SVG</a>
 | 
<a id="plot_id982485706_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id982485706" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id982485706_download" class="ggvis-download" data-plot-id="plot_id982485706">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id982485706_spec = {
  "data": [
    {
      "name": ".0/bin1/stack2",
      "format": {
        "type": "csv",
        "parse": {
          "xmin_": "number",
          "xmax_": "number",
          "stack_upr_": "number",
          "stack_lwr_": "number"
        }
      },
      "values": "\"xmin_\",\"xmax_\",\"stack_upr_\",\"stack_lwr_\"\n9.5,10.5,2,0\n10.5,11.5,0,0\n11.5,12.5,0,0\n12.5,13.5,1,0\n13.5,14.5,1,0\n14.5,15.5,5,0\n15.5,16.5,2,0\n16.5,17.5,1,0\n17.5,18.5,2,0\n18.5,19.5,3,0\n19.5,20.5,1,0\n20.5,21.5,5,0\n21.5,22.5,0,0\n22.5,23.5,2,0\n23.5,24.5,1,0\n24.5,25.5,0,0\n25.5,26.5,1,0\n26.5,27.5,1,0\n27.5,28.5,0,0\n28.5,29.5,0,0\n29.5,30.5,2,0\n30.5,31.5,0,0\n31.5,32.5,1,0\n32.5,33.5,0,0\n33.5,34.5,1,0"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n8.25\n35.75"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n0\n5.25"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "rect",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "fill": {
            "value": "#333333"
          },
          "x": {
            "scale": "x",
            "field": "data.xmin_"
          },
          "x2": {
            "scale": "x",
            "field": "data.xmax_"
          },
          "y": {
            "scale": "y",
            "field": "data.stack_upr_"
          },
          "y2": {
            "scale": "y",
            "field": "data.stack_lwr_"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/bin1/stack2"
          }
        }
      },
      "from": {
        "data": ".0/bin1/stack2"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "count"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id982485706").parseSpec(plot_id982485706_spec);
</script>
```


```r
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()
```

```{=html}
<div id="plot_id767369375-container" class="ggvis-output-container">
<div id="plot_id767369375" class="ggvis-output"></div>
<div class="plot-gear-icon">
<nav class="ggvis-control">
<a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: 
<a id="plot_id767369375_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id767369375" data-renderer="svg">SVG</a>
 | 
<a id="plot_id767369375_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id767369375" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id767369375_download" class="ggvis-download" data-plot-id="plot_id767369375">Download</a>
</li>
</ul>
</nav>
</div>
</div>
<script type="text/javascript">
var plot_id767369375_spec = {
  "data": [
    {
      "name": ".0/model_prediction1",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\"\n1.513,32.08897233857\n1.56250632911392,31.6878645869701\n1.61201265822785,31.2816303797919\n1.66151898734177,30.8703709543688\n1.7110253164557,30.4541875480347\n1.76053164556962,30.0331813981232\n1.81003797468354,29.6074537419678\n1.85954430379747,29.1771058169022\n1.90905063291139,28.7422388602601\n1.95855696202532,28.3001719301537\n2.00806329113924,27.834621969428\n2.05756962025316,27.3476575600419\n2.10707594936709,26.84497968394\n2.15658227848101,26.3322893230667\n2.20608860759494,25.8152874593666\n2.25559493670886,25.2996750747841\n2.30510126582278,24.7911531512637\n2.35460759493671,24.29542267075\n2.40411392405063,23.8181846151875\n2.45362025316456,23.3651399665205\n2.50312658227848,22.955253039598\n2.55263291139241,22.6138488714952\n2.60213924050633,22.3275852300224\n2.65164556962025,22.0817586181852\n2.70115189873418,21.8616655389892\n2.7506582278481,21.65260249544\n2.80016455696203,21.4398659905432\n2.84967088607595,21.2087525273044\n2.89917721518987,20.953335722037\n2.9486835443038,20.7158424594628\n2.99818987341772,20.4957065225374\n3.04769620253165,20.2829337645837\n3.09720253164557,20.0675300389245\n3.14670886075949,19.8395011988825\n3.19621518987342,19.5888530977805\n3.24572151898734,19.2971559094315\n3.29522784810127,18.9444093670088\n3.34473417721519,18.5670026794964\n3.39424050632911,18.2056968860288\n3.44374683544304,17.9009022641924\n3.49325316455696,17.620602502374\n3.54275949367089,17.3400153015964\n3.59226582278481,17.079077805285\n3.64177215189873,16.8175887231322\n3.69127848101266,16.5575726926136\n3.74078481012658,16.3083303048321\n3.79029113924051,16.0791621508901\n3.83979746835443,15.8793688218903\n3.88930379746835,15.7018119854881\n3.93881012658228,15.5259429561214\n3.9883164556962,15.3517253848296\n4.03782278481013,15.1793328075288\n4.08732911392405,15.0089387601353\n4.13683544303798,14.8407167785652\n4.1863417721519,14.6748403987346\n4.23584810126582,14.5114831565596\n4.28535443037975,14.3508185879563\n4.33486075949367,14.193020228841\n4.3843670886076,14.0382616151298\n4.43387341772152,13.8867162827388\n4.48337974683544,13.7385577675841\n4.53288607594937,13.5939596055819\n4.58239240506329,13.4530953326483\n4.63189873417722,13.3161384846995\n4.68140506329114,13.1832625976516\n4.73091139240506,13.0546412074207\n4.78041772151899,12.930447849923\n4.82992405063291,12.8108560610747\n4.87943037974684,12.6960393767918\n4.92893670886076,12.5861713329905\n4.97844303797468,12.4814254655869\n5.02794936708861,12.3819753104973\n5.07745569620253,12.2879944036376\n5.12696202531646,12.1996562809241\n5.17646835443038,12.117134478273\n5.2259746835443,12.0406025316002\n5.27548101265823,11.9702339768221\n5.32498734177215,11.9062023498547\n5.37449367088608,11.8486811866141\n5.424,11.7978440230166"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n10.7832876072389\n33.1035287543477"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "line",
      "properties": {
        "update": {
          "stroke": {
            "value": "#000000"
          },
          "strokeWidth": {
            "value": 2
          },
          "x": {
            "scale": "x",
            "field": "data.pred_"
          },
          "y": {
            "scale": "y",
            "field": "data.resp_"
          },
          "fill": {
            "value": "transparent"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0/model_prediction1"
          }
        }
      },
      "from": {
        "data": ".0/model_prediction1"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "mpg"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id767369375").parseSpec(plot_id767369375_spec);
</script>
```


