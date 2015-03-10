<range>

  {legend}

  <label if={lowPoint} for="range-low">
    {lowAdjective[invert]} <b>{low} {units}</b>
  </label>
  <span if={lowPoint && highPoint}>{combinator[invert]}</span>
  <label if={highPoint} for="range-high">
    {highAdjective[invert]} <b>{high} {units}</b>
  </label>

  <br>

  <div class="range-multiple">

    <svg id="range-background" class="range-background" role="presentation" preserveaspectratio="none" xmlns="http://www.w3.org/2000/svg">
      <path
        class="range-track"
        d="M{min},0 L{min},100 L{max},100 L{max},0 Z"
      ></path>
      <path if={((highPoint || lowPoint) && !invert)}
        class="range-track-low-high"
        d="M{low},0 L{low},100 L{high},100 L{high},0 Z"
      ></path>
      <path if={(lowPoint && invert) || (!lowPoint && highPoint && !invert)}
        class="range-track-min-low"
        d="M{min},0 L{min},100 L{low},100 L{low},0 Z"
      ></path>
      <path if={(highPoint && invert) || (!highPoint && lowPoint && !invert )}
        class="range-track-high-max"
        d="M{high},0 L{high},100 L{max},100 L{max},0 Z"
      ></path>
    </svg>

    <input if={lowPoint} id="range-low" type="range" value="{low}" min="{min}" max="{max}" step="{step}" oninput={input} name="low">

    <input if={highPoint} id="range-high" type="range" value="{high}" min="{min}" max="{max}" step="{step}" oninput={input} name="high">

  </div>

  <br>

  <label if={lowToggle} for="toggle-low">
    <input type="checkbox" id="toggle-low" checked={lowPoint} onchange={toggle} name="lowPoint">
    Low point
  </label>

  <br>

  <label if={highToggle} for="toggle-high">
    <input type="checkbox" id="toggle-high" checked={highPoint} onchange={toggle} name="highPoint">
    High point
  </label>

  <br>

  <label if={invertToggle} for="toggle-invert">
    <input type="checkbox" id="toggle-invert" checked={invert} onchange={toggle}  name="invert">
    Invert range
  </label>


  <script>
    this.legend = opts.legend;
    this.min = opts.min;
    this.max = opts.max;
    this.step = opts.step;
    this.units = opts.units;
    this.lowPoint = opts.lowPoint;
    this.lowToggle = opts.lowToggle;
    this.lowAdjective = opts.lowAdjective;
    this.low = opts.low;
    this.combinator = opts.combinator;
    this.highPoint = opts.highPoint;
    this.highToggle = opts.highToggle;
    this.highAdjective = opts.highAdjective;
    this.high = opts.high;
    this.invertToggle = opts.invertToggle;
    this.invert = opts.invert;


    //HACK: Riot or Chrome choked on the viewbox attribute in html, so setting it here and not in the html
    this.on('mount', function() {
      var viewboxAttr = this.min + ' 0 ' + (this.max - this.min) + ' 100';
      this['range-background'].setAttribute('viewBox', viewboxAttr);
    })

    input(e) {
      var value = e.target.value;
      var name = e.target.name;
      var low;
      var high;
      this[name] = value;

      //Make sure you can't flip the low & high points by dragging
      low = parseInt(this['low']);
      high = parseInt(this['high']);
      if (name == 'low' && low > high) {
        this['high'] = this['low'];
      }
      if (name == 'high' && high < low) {
        this['low'] = this['high'];
      }
    }

    toggle(e) {
      var checked = e.target.checked;
      var name = e.target.name;
      this[name] = checked + 0;
    }

  </script>
</range>
