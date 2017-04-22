using UnityEngine;
using Klak.Spout;

namespace Beta
{
    public class KodeProjector : MonoBehaviour
    {
        #region Editable properties

        [SerializeField] SpoutReceiver _receiver;
        [SerializeField] Vector2 _extent = Vector2.one;

        [SerializeField] float _intensity = 1;

        public float intensity {
            get { return _intensity; }
            set { _intensity = value; }
        }

        #endregion

        #region MonoBehaviour functions

        void Update()
        {
            var vparams = new Vector3(1 / _extent.x, 1 / _extent.y, _intensity);
            Shader.SetGlobalTexture("_KodeLife_MainTex",  _receiver.receivedTexture);
            Shader.SetGlobalVector("_KodeLife_Params", vparams);
        }

        #endregion
    }
}
