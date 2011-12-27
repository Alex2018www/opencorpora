{extends file='common.tpl'}

{block name=content}
<style type="text/css">
    #chart {
        width: 800px;
        height: 600px;
        margin-bottom: 1em;
    }
    #update {
        margin-right: 3em;
    }
    #threshold {
        margin-left: 1em;
    }
</style>
<script type="text/javascript" src="{$web_prefix}/js/jquery.flot.min.js"></script>
<script type="text/javascript">
{literal}
    $(document).ready(function() {
        var dates = $('#from, #until').datepicker({
            dateFormat: 'yy-mm-dd',
            constraintInput: true,
            onSelect: function(selected) {
                var option = this.id == 'from' ? 'minDate' : 'maxDate',
                    instance = $(this).data('datepicker'),
                    date = $.datepicker.parseDate(
                        instance.settings.dateFormat,
                        selected,
                        instance.settings
                    );
                dates.not(this).datepicker('option', option, date);
            }
        });
        $(dates[1]).datepicker('setDate', new Date());
        $(dates[0]).datepicker('setDate', '-1m');

        function update() {
            $.get(
                '/ajax/tokenizer_monitor.php',
                {
                    from: $('#from').val(),
                    until: $('#until').val()
                },
                function(json) {
                    plot(json);
                },
                'json'
            );
        }

        function plot(json) {
            var datasets = [];
            $.each(
                json,
                function(idx) {
                    if($('#' + idx + ':checked').length == 0) return;

                    var dataset = {
                        label: idx,
                        data: json[idx][$('#threshold').val()]
                    };
                    datasets.push(dataset);
                }
            );

            var options = {
                xaxis: {
                    mode: 'time',
                    timeformat: '%d-%m-%y',
                    minTickSize: [1, 'day']
                },
                legend: {
                    show: true,
                    position: 'se',
                    backgroundOpacity: 1
                },
                series: {
                    lines: {show: true},
                    points: {show: true}
                }
            };

            $.plot($('#chart'), datasets, options);
        }

        $('#update, #precision, #recall, #F1').click(function() {
            update();
        });

        $('#threshold').change(function() {
            update();
        });

        $('#update').click();
    });
{/literal}
</script>

<h1>{t}Контроль качества токенизатора{/t}</h1>

<div id="chart"></div>

<div id="controls">
    <label for="from">{t}С{/t}</label>
    <input type="text" id="from"/>

    <label for="until">{t}По{/t}</label>
    <input type="text" id="until"/>

    <input type="button" id="update" value="{t}Обновить{/t}"/>

    <input type="checkbox" id="precision" checked="checked"/>
    <label for="precision">precision</label>

    <input type="checkbox" id="recall" checked="checked"/>
    <label for="recall">recall</label>

    <input type="checkbox" id="F1" checked="checked"/>
    <label for="F1">F1</label>

    <select name="threshold" id="threshold">
        <option>0</option>
        <option>0.01</option>
        <option>0.05</option>
        <option>0.1</option>
        <option>0.15</option>
        <option>0.2</option>
        <option>0.25</option>
        <option>0.3</option>
        <option>0.35</option>
        <option>0.4</option>
        <option>0.45</option>
        <option>0.5</option>
        <option>0.55</option>
        <option>0.6</option>
        <option>0.65</option>
        <option>0.7</option>
        <option>0.75</option>
        <option>0.8</option>
        <option>0.85</option>
        <option>0.9</option>
        <option>0.95</option>
        <option>0.99</option>
        <option>1</option>
    </select>
</div>

{/block}