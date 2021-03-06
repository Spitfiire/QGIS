class QgsRasterMinMaxWidget: QWidget
{
%TypeHeaderCode
#include <qgsrasterminmaxwidget.h>
%End
  public:
    QgsRasterMinMaxWidget( QgsRasterLayer* theLayer, QWidget *parent /TransferThis/ = 0 );
    ~QgsRasterMinMaxWidget();

    /** Sets the extent to use for minimum and maximum value calculation.
     * @param theExtent extent in raster layer's CRS
     * @note if a map canvas is set using setMapCanvas(), its extent will take
     * precedence over any extent set using this method.
     */
    void setExtent( const QgsRectangle& theExtent );

    /** Sets the map canvas associated with the widget. This allows the widget to retrieve the current
     * map extent from the canvas. If a canvas is set it will take precedence over any extent
     * set from calling setExtent().
     * @param canvas map canvas
     * @see mapCanvas()
     * @note added in QGIS 2.16
     */
    void setMapCanvas( QgsMapCanvas* canvas );

    /** Returns the map canvas associated with the widget.
     * @see setMapCanvas()
     * @see canvasExtent()
     * @note added in QGIS 2.16
     */
    QgsMapCanvas* mapCanvas();

    void setBands( const QList<int> & theBands );
    /** Return the extent selected by the user.
        Either an empty extent for 'full' or the current visible extent. */
    QgsRectangle extent();
    /** Return the selected sample size. */
    int sampleSize();

    //! \brief Set the "source" of min/max values.
    void setFromMinMaxOrigin( const QgsRasterMinMaxOrigin& );

    //! \brief Return a QgsRasterMinMaxOrigin object with the widget values.
    QgsRasterMinMaxOrigin minMaxOrigin();

    //! Hide updated extent radio button
    void hideUpdatedExtent();

    //! Load programmatically with current values
    void doComputations();

    //! Uncheck cumulative cut, min/max, std-dev radio buttons
    void userHasSetManualMinMaxValues();

    //! Return if the widget is collaped.
    bool isCollapsed() const;

    //! Set collapsed state of widget
    void setCollapsed(bool b);

  signals:
    /**
     * Emitted when something on the widget has changed.
     * All widgets will fire this event to notify of an internal change.
     */
    void widgetChanged();

    //! signal emitted when new min/max values are computed from statistics.
    void load( int theBandNo, double theMin, double theMax );
};
